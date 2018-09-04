'use strict';
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const environmentController_1 = require("./controllers/environmentController");
const Constants = require("./constants");
const requestVariableCache_1 = require("./requestVariableCache");
const requestVariableCacheKey_1 = require("./models/requestVariableCacheKey");
const requestVariableCacheValueProcessor_1 = require("./requestVariableCacheValueProcessor");
const httpClient_1 = require("./httpClient");
const httpRequest_1 = require("./models/httpRequest");
const configurationSettings_1 = require("./models/configurationSettings");
const variableType_1 = require("./models/variableType");
const adal = require("adal-node");
const moment_1 = require("moment");
const copyPaste = require('copy-paste');
const uuid = require('node-uuid');
const aadRegexPattern = `\\{\\{\\s*\\${Constants.AzureActiveDirectoryVariableName}(\\s+(${Constants.AzureActiveDirectoryForceNewOption}))?(\\s+(ppe|public|cn|de|us))?(\\s+([^\\.]+\\.[^\\}\\s]+|[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}))?(\\s+aud:([^\\.]+\\.[^\\}\\s]+|[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}))?\\s*\\}\\}`;
const aadTokenCache = {};
class VariableProcessor {
    static processRawRequest(request) {
        return __awaiter(this, void 0, void 0, function* () {
            let globalVariables = VariableProcessor.getGlobalVariables();
            for (let variablePattern in globalVariables) {
                let regex = new RegExp(`\\{\\{\\s*${variablePattern}\\s*\\}\\}`, 'g');
                if (regex.test(request)) {
                    request = request.replace(regex, globalVariables[variablePattern]);
                }
            }
            let requestVariables = VariableProcessor.getRequestVariablesInCurrentFile();
            for (let [variableName, variableValue] of requestVariables) {
                let regex = new RegExp(`\\{\\{\\s*${variableName}.*?\\s*\\}\\}`, 'g');
                let matches = request.match(regex);
                if (matches && matches.length > 0) {
                    for (let i = 0; i < matches.length; i++) {
                        const requestVariable = matches[i].replace('{{', '').replace('}}', '');
                        let value;
                        let result = requestVariableCacheValueProcessor_1.RequestVariableCacheValueProcessor.resolveRequestVariable(variableValue, requestVariable);
                        if (result.state !== 0 /* Success */) {
                            const { state, message } = result;
                            value = `{{${requestVariable}}}`;
                            if (state === 1 /* Warning */) {
                                console.warn(message);
                            }
                            else {
                                console.error(message);
                            }
                        }
                        else {
                            value = result.value;
                        }
                        const escapedVariable = VariableProcessor.escapeRegExp(requestVariable);
                        request = request.replace(new RegExp(`\\{\\{\\s*${escapedVariable}\\s*\\}\\}`, 'g'), value);
                    }
                }
            }
            let fileVariables = VariableProcessor.getCustomVariablesInCurrentFile();
            for (let [variableName, variableValue] of fileVariables) {
                let regex = new RegExp(`\\{\\{\\s*${variableName}\\s*\\}\\}`, 'g');
                if (regex.test(request)) {
                    request = request.replace(regex, variableValue);
                }
            }
            let environmentVariables = yield environmentController_1.EnvironmentController.getCustomVariables();
            for (let [variableName, variableValue] of environmentVariables) {
                let regex = new RegExp(`\\{\\{\\s*${variableName}\\s*\\}\\}`, 'g');
                if (regex.test(request)) {
                    request = request.replace(regex, variableValue);
                }
            }
            // any vars that make decisions on the URL (request var) must be last so all vars have been evaluated
            let aadRegex = new RegExp(aadRegexPattern, 'g');
            if (aadRegex.test(request)) {
                request = request.replace(aadRegex, yield VariableProcessor.getAadToken(request));
            }
            return request;
        });
    }
    static clearAadTokenCache() {
        for (let key in aadTokenCache) {
            delete aadTokenCache[key];
        }
    }
    static getAadToken(url) {
        // get target app from URL
        let targetApp = (new RegExp("^[^\\s]+\\s+([^:]*:///?[^/]*/)").exec(url) || [url])[1] || "";
        // detect known cloud URLs + fix audiences
        let defaultCloud = null;
        let cloud = null;
        for (let c in Constants.AzureClouds) {
            // set first cloud to be default
            if (!defaultCloud) {
                defaultCloud = c;
            }
            let found = false;
            for (let api in Constants.AzureClouds[c]) {
                if (api.endsWith("Audience")) {
                    continue;
                }
                if (targetApp === Constants.AzureClouds[c][api]) {
                    cloud = c;
                    targetApp = Constants.AzureClouds[c][api + "Audience"] || targetApp;
                    found = true;
                    break;
                }
            }
            if (found) {
                break;
            }
        }
        // fall back to URL TLD
        if (cloud === null) {
            cloud = targetApp.substring(targetApp.lastIndexOf(".") + 1, targetApp.length - 1);
        }
        // parse input options -- [new] [public|cn|de|us|ppe] [<domain|tenantId>] [aud:<domain|tenantId>]
        let tenantId = Constants.AzureActiveDirectoryDefaultTenantId;
        let forceNewToken = false;
        const groups = new RegExp(aadRegexPattern).exec(url);
        if (groups) {
            forceNewToken = groups[2] === Constants.AzureActiveDirectoryForceNewOption;
            cloud = groups[4] || cloud;
            tenantId = groups[6] || tenantId;
            targetApp = groups[8] || targetApp;
        }
        // verify cloud (default to public)
        cloud = Constants.AzureClouds[cloud] ? cloud : defaultCloud;
        const endpoint = Constants.AzureClouds[cloud].aad;
        const signInUrl = `${endpoint}${tenantId}`;
        const authContext = new adal.AuthenticationContext(signInUrl);
        const clientId = Constants.AzureActiveDirectoryClientId;
        return new Promise((resolve, reject) => {
            const resolveToken = (token, cache = true, copy) => {
                if (cache) {
                    // save token using both specified and resulting domain/tenantId to cover more reuse scenarios
                    aadTokenCache[`${cloud}:${tenantId}`] = aadTokenCache[`${cloud}:${token.tenantId}`] = token;
                }
                const tokenString = token ? `${token.tokenType} ${token.accessToken}` : null;
                if (copy && tokenString) {
                    // only copy the token to the clipboard if it's the first use (since we tell them we're doing it)
                    copyPaste.copy(tokenString);
                }
                resolve(tokenString);
            };
            const acquireToken = () => this._acquireToken(resolveToken, reject, authContext, cloud, tenantId, targetApp, clientId);
            // use previous token, if one has been obtained for the directory
            const cachedToken = !forceNewToken && aadTokenCache[`${cloud}:${tenantId}`];
            if (cachedToken) {
                // if token expired, try to refresh; otherwise, use cached token
                if (cachedToken.expiresOn <= new Date()) {
                    authContext.acquireTokenWithRefreshToken(cachedToken.refreshToken, clientId, targetApp, (refreshError, refreshResponse) => {
                        // if refresh fails, acquire new token; otherwise, cache updated token
                        if (refreshError) {
                            acquireToken();
                        }
                        else {
                            resolveToken(refreshResponse);
                        }
                    });
                }
                else {
                    resolveToken(cachedToken, false);
                }
                return;
            }
            acquireToken();
        });
    }
    static _acquireToken(resolve, reject, authContext, cloud, tenantId, targetApp, clientId) {
        const messageBoxOptions = { modal: true };
        const signInFailed = (stage, message) => {
            vscode_1.window.showErrorMessage(`Sign in failed. Please try again.\r\n\r\nStage: ${stage}\r\n\r\n${message}`, messageBoxOptions);
        };
        authContext.acquireUserCode(targetApp, clientId, "en-US", (codeError, codeResponse) => {
            if (codeError) {
                signInFailed("acquireUserCode", codeError.message);
                return reject(codeError);
            }
            const prompt1 = `Sign in to Azure AD with the following code (will be copied to the clipboard) to add a token to your request.\r\n\r\nCode: ${codeResponse.userCode}`;
            const prompt2 = `1. Azure AD verification page opened in default browser (you may need to switch apps)\r\n2. Paste code to sign in and authorize VS Code (already copied to the clipboard)\r\n3. Confirm when done\r\n4. Token will be copied to the clipboard when finished\r\n\r\nCode: ${codeResponse.userCode}`;
            const signIn = "Sign in";
            const tryAgain = "Try again";
            const done = "Done";
            const signInPrompt = value => {
                if (value === signIn || value === tryAgain) {
                    copyPaste.copy(codeResponse.userCode);
                    vscode_1.commands.executeCommand("vscode.open", vscode_1.Uri.parse(codeResponse.verificationUrl));
                    vscode_1.window.showInformationMessage(prompt2, messageBoxOptions, done, tryAgain).then(signInPrompt);
                }
                else if (value === done) {
                    authContext.acquireTokenWithDeviceCode(targetApp, clientId, codeResponse, (tokenError, tokenResponse) => {
                        if (tokenError) {
                            signInFailed("acquireTokenWithDeviceCode", tokenError.message);
                            return reject(tokenError);
                        }
                        // if no directory chosen, pick one (otherwise, the token is likely useless :P)
                        if (tenantId === Constants.AzureActiveDirectoryDefaultTenantId) {
                            const settings = new configurationSettings_1.RestClientSettings();
                            const client = new httpClient_1.HttpClient(settings);
                            const request = new httpRequest_1.HttpRequest("GET", `${Constants.AzureClouds[cloud].arm}/tenants?api-version=2017-08-01`, { Authorization: this._getTokenString(tokenResponse) }, null, null);
                            return client.send(request).then((value) => __awaiter(this, void 0, void 0, function* () {
                                const items = JSON.parse(value.body).value;
                                const directories = [];
                                items.forEach(element => {
                                    /**
                                     * Some directories have multiple domains, but ARM doesn't return the primary domain
                                     * first. For instance, Microsoft has 268 domains and "microsoft.com" is #12. This
                                     * block attempts to pick the closest match based on the first word of the display
                                     * name (e.g. "Foo" in "Foo Bar"). If the search fails, the first domain is used.
                                     */
                                    let displayName = element.displayName;
                                    const count = element.domains.length;
                                    let domain = element.domains && element.domains[0];
                                    if (count > 1) {
                                        try {
                                            // find the best matches
                                            const displayNameSpaceIndex = displayName.indexOf(" ");
                                            const displayNameFirstWord = displayNameSpaceIndex > -1
                                                ? displayName.substring(0, displayNameSpaceIndex)
                                                : displayName;
                                            let bestMatches = [];
                                            const bestMatchesRegex = new RegExp(`(^${displayNameFirstWord}\.com$)|(^${displayNameFirstWord}\.[a-z]+(?:\.[a-z]+)?$)|(^${displayNameFirstWord}[a-z]+\.com$)|(^${displayNameFirstWord}[^:]*$)|(^[^:]*${displayNameFirstWord}[^:]*$)`, "gi");
                                            const bestMatchesRegexGroups = bestMatchesRegex.source.match(new RegExp(`${displayNameFirstWord}`, "g")).length;
                                            for (let d of element.domains) {
                                                // find matches; use empty array for all captures (+1 for the full string) if no matches found
                                                const matches = bestMatchesRegex.exec(d)
                                                    || Array(bestMatchesRegexGroups + 1).fill(null);
                                                // stop looking if the best match is found
                                                bestMatches[0] = matches[1];
                                                if (bestMatches[0]) {
                                                    break;
                                                }
                                                // keep old matches, save new matches
                                                for (let g = 1; g < bestMatchesRegexGroups; g++) {
                                                    bestMatches[g] = bestMatches[g] || matches[g + 1];
                                                }
                                            }
                                            // use the first match in the array of matches
                                            domain = bestMatches.find(m => m) || domain;
                                        }
                                        catch (_a) {
                                        }
                                        domain = `${domain} (+${count - 1} more)`;
                                    }
                                    /**
                                     * People with multiple directories sometimes end up 2 or more "Default Directory"
                                     * names. To improve findability and recognition speed, we are prepending the domain
                                     * prefix (e.g. abc.onmicrosoft.com == "abc (Default Directory)"), making the sorted
                                     * list easier to traverse.
                                     */
                                    if (displayName === Constants.AzureActiveDirectoryDefaultDisplayName) {
                                        const separator = domain.indexOf(".");
                                        displayName = `${separator > 0 ? domain.substring(0, separator) : domain} (${displayName})`;
                                    }
                                    directories.push({ label: displayName, description: element.tenantId, detail: domain });
                                });
                                // default to first directory
                                let result = directories.length && directories[0];
                                if (directories.length > 1) {
                                    // sort by display name and domain (in case display name isn't unique)
                                    directories.sort((a, b) => a.label + a.detail < b.label + b.detail ? -1 : 1);
                                    const options = {
                                        matchOnDescription: true,
                                        matchOnDetail: true,
                                        placeHolder: `Select the directory to sign in to or press 'Esc' to use the default`,
                                        ignoreFocusOut: true,
                                    };
                                    result = yield vscode_1.window.showQuickPick(directories, options);
                                }
                                // if directory selected, sign in to that directory; otherwise, stick with the default
                                if (result) {
                                    const newDirAuthContext = new adal.AuthenticationContext(`${Constants.AzureClouds[cloud].aad}${result.description}`);
                                    newDirAuthContext.acquireTokenWithRefreshToken(tokenResponse.refreshToken, clientId, null, (newDirError, newDirResponse) => {
                                        // cache/copy new directory token, if successful
                                        resolve(newDirError ? tokenResponse : newDirResponse, true, true);
                                    });
                                }
                                else {
                                    return resolve(tokenResponse, true, true);
                                }
                            }));
                        }
                        // explicitly copy this token since we've informed the user in the dialog
                        return resolve(tokenResponse, true, true);
                    });
                }
            };
            vscode_1.window.showInformationMessage(prompt1, messageBoxOptions, signIn).then(signInPrompt);
        });
    }
    static _getTokenString(token) {
        return token ? `${token.tokenType} ${token.accessToken}` : null;
    }
    static getGlobalVariables() {
        return {
            [`\\${Constants.TimeStampVariableName}(?:\\s(\\-?\\d+)\\s(y|Q|M|w|d|h|m|s|ms))?`]: match => {
                let regex = new RegExp(`\\${Constants.TimeStampVariableName}(?:\\s(\\-?\\d+)\\s(y|Q|M|w|d|h|m|s|ms))?`);
                let groups = regex.exec(match);
                if (groups !== null && groups.length === 3) {
                    return groups[1] && groups[2]
                        ? moment_1.utc().add(Number(groups[1]), groups[2]).unix()
                        : moment_1.utc().unix();
                }
                return match;
            },
            [`\\${Constants.DateTimeVariableName}(?:\\s(rfc1123|iso8601)?(?:\\s(\\-?\\d+)\\s(y|Q|M|w|d|h|m|s|ms))?)?`]: match => {
                let regex = new RegExp(`\\${Constants.DateTimeVariableName}(?:\\s(rfc1123|iso8601)?(?:\\s(\\-?\\d+)\\s(y|Q|M|w|d|h|m|s|ms))?)?`);
                let groups = regex.exec(match);
                if (groups !== null && groups.length === 4) {
                    let date;
                    if (groups[2] && groups[3]) {
                        date = moment_1.utc().add(Number(groups[2]), groups[3]);
                    }
                    else {
                        date = moment_1.utc();
                    }
                    return groups[1] === 'rfc1123' ? date.toString() : date.toISOString();
                }
                return match;
            },
            [`\\${Constants.GuidVariableName}`]: match => uuid.v4(),
            [`\\${Constants.RandomInt}\\s(\\-?\\d+)\\s(\\-?\\d+)`]: match => {
                let regex = new RegExp(`\\${Constants.RandomInt}\\s(\\-?\\d+)\\s(\\-?\\d+)`);
                let groups = regex.exec(match);
                if (groups !== null) {
                    let min = Number(groups[1]);
                    let max = Number(groups[2]);
                    if (min < max) {
                        min = Math.ceil(min);
                        max = Math.floor(max);
                        return Math.floor(Math.random() * (max - min)) + min;
                    }
                }
                return match;
            }
        };
    }
    static getCustomVariablesInCurrentFile() {
        let editor = vscode_1.window.activeTextEditor;
        if (!editor || !editor.document) {
            return new Map();
        }
        return VariableProcessor.getCustomVariablesInFile(editor.document);
    }
    static getCustomVariablesInFile(document) {
        let variables = new Map();
        let text = document.getText();
        let lines = text.split(/\r?\n/g);
        lines.forEach(line => {
            let match;
            if (match = Constants.VariableDefinitionRegex.exec(line)) {
                let key = match[1];
                let originalValue = match[2];
                let value = "";
                let isPrevCharEscape = false;
                for (let index = 0; index < originalValue.length; index++) {
                    let currentChar = originalValue[index];
                    if (isPrevCharEscape) {
                        isPrevCharEscape = false;
                        value += this.escapee.get(currentChar) || currentChar;
                    }
                    else {
                        if (currentChar === "\\") {
                            isPrevCharEscape = true;
                            continue;
                        }
                        value += currentChar;
                    }
                }
                variables.set(key, value);
            }
        });
        return variables;
    }
    static getRequestVariablesInCurrentFile(activeOnly = true) {
        let editor = vscode_1.window.activeTextEditor;
        if (!editor || !editor.document) {
            return new Map();
        }
        return VariableProcessor.getRequestVariablesInFile(editor.document, activeOnly);
    }
    static getRequestVariablesInFile(document, activeOnly = true) {
        let variables = new Map();
        let text = document.getText();
        let lines = text.split(/\r?\n/g);
        let documentUri = document.uri.toString();
        lines.forEach(line => {
            let match;
            if (match = Constants.RequestVariableDefinitionRegex.exec(line)) {
                let key = match[1];
                const response = requestVariableCache_1.RequestVariableCache.get(new requestVariableCacheKey_1.RequestVariableCacheKey(key, documentUri));
                if (!activeOnly || response) {
                    variables.set(key, response);
                }
            }
        });
        return variables;
    }
    static getAllVariablesDefinitions(document) {
        return __awaiter(this, void 0, void 0, function* () {
            const requestVariables = VariableProcessor.getRequestVariablesInFile(document, false);
            const fileVariables = VariableProcessor.getCustomVariablesInFile(document);
            const environmentVariables = yield environmentController_1.EnvironmentController.getCustomVariables();
            const variableDefinitions = new Map();
            // Request variables in file
            requestVariables.forEach((val, key) => {
                if (variableDefinitions.has(key)) {
                    variableDefinitions.get(key).push(variableType_1.VariableType.Request);
                }
                else {
                    variableDefinitions.set(key, [variableType_1.VariableType.Request]);
                }
            });
            // Normal file variables
            fileVariables.forEach((val, key) => {
                variableDefinitions.set(key, [variableType_1.VariableType.File]);
            });
            // Environment variables
            environmentVariables.forEach((val, key) => {
                if (variableDefinitions.has(key)) {
                    variableDefinitions.get(key).push(variableType_1.VariableType.Environment);
                }
                else {
                    variableDefinitions.set(key, [variableType_1.VariableType.Environment]);
                }
            });
            return variableDefinitions;
        });
    }
    static escapeRegExp(str) {
        return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
    }
}
VariableProcessor.escapee = new Map([
    ['n', '\n'],
    ['r', '\r'],
    ['t', '\t']
]);
exports.VariableProcessor = VariableProcessor;
//# sourceMappingURL=variableProcessor.js.map