"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
const os_1 = require("os");
const vscode_1 = require("vscode");
const arrayUtility_1 = require("../common/arrayUtility");
const Constants = __importStar(require("../common/constants"));
const codeSnippetClient_1 = require("../models/codeSnippetClient");
const codeSnippetClientPickItem_1 = require("../models/codeSnippetClientPickItem");
const codeSnippetTarget_1 = require("../models/codeSnippetTarget");
const codeSnippetTargetPickItem_1 = require("../models/codeSnippetTargetPickItem");
const harHttpRequest_1 = require("../models/harHttpRequest");
const requestParserFactory_1 = require("../models/requestParserFactory");
const decorator_1 = require("../utils/decorator");
const selector_1 = require("../utils/selector");
const telemetry_1 = require("../utils/telemetry");
const variableProcessor_1 = require("../utils/variableProcessor");
const workspaceUtility_1 = require("../utils/workspaceUtility");
const codeSnippetWebview_1 = require("../views/codeSnippetWebview");
const clipboardy = require('clipboardy');
const encodeUrl = require('encodeurl');
const HTTPSnippet = require('httpsnippet');
class CodeSnippetController {
    constructor() {
        this._webview = new codeSnippetWebview_1.CodeSnippetWebview();
    }
    run() {
        return __awaiter(this, void 0, void 0, function* () {
            const editor = vscode_1.window.activeTextEditor;
            const document = workspaceUtility_1.getCurrentTextDocument();
            if (!editor || !document) {
                return;
            }
            // Get selected text of selected lines or full document
            let selectedText = new selector_1.Selector().getSelectedText(editor);
            if (!selectedText) {
                return;
            }
            // remove comment lines
            let lines = selectedText.split(Constants.LineSplitterRegex).filter(l => !Constants.CommentIdentifiersRegex.test(l));
            if (lines.length === 0 || lines.every(line => line === '')) {
                return;
            }
            // remove file variables definition lines and leading empty lines
            selectedText = arrayUtility_1.ArrayUtility.skipWhile(lines, l => Constants.FileVariableDefinitionRegex.test(l) || l.trim() === '').join(os_1.EOL);
            // variables replacement
            selectedText = yield variableProcessor_1.VariableProcessor.processRawRequest(selectedText);
            // parse http request
            let httpRequest = new requestParserFactory_1.RequestParserFactory().createRequestParser(selectedText).parseHttpRequest(selectedText, document.fileName);
            if (!httpRequest) {
                return;
            }
            let harHttpRequest = this.convertToHARHttpRequest(httpRequest);
            let snippet = new HTTPSnippet(harHttpRequest);
            if (CodeSnippetController._availableTargets) {
                let targetsPickList = CodeSnippetController._availableTargets.map(target => {
                    let item = new codeSnippetTargetPickItem_1.CodeSnippetTargetQuickPickItem();
                    item.label = target.title;
                    item.rawTarget = new codeSnippetTarget_1.CodeSnippetTarget();
                    item.rawTarget.default = target.default;
                    item.rawTarget.extname = target.extname;
                    item.rawTarget.key = target.key;
                    item.rawTarget.title = target.title;
                    item.rawTarget.clients = target.clients.map(client => {
                        let clientItem = new codeSnippetClient_1.CodeSnippetClient();
                        clientItem.key = client.key;
                        clientItem.link = client.link;
                        clientItem.title = client.title;
                        clientItem.description = client.description;
                        return clientItem;
                    });
                    return item;
                });
                let item = yield vscode_1.window.showQuickPick(targetsPickList, { placeHolder: "" });
                if (!item) {
                    return;
                }
                else {
                    let clientsPickList = item.rawTarget.clients.map(client => {
                        let item = new codeSnippetClientPickItem_1.CodeSnippetClientQuickPickItem();
                        item.label = client.title;
                        item.description = client.description;
                        item.detail = client.link;
                        item.rawClient = client;
                        return item;
                    });
                    let client = yield vscode_1.window.showQuickPick(clientsPickList, { placeHolder: "" });
                    if (client) {
                        telemetry_1.Telemetry.sendEvent('Generate Code Snippet', { 'target': item.rawTarget.key, 'client': client.rawClient.key });
                        let result = snippet.convert(item.rawTarget.key, client.rawClient.key);
                        this._convertedResult = result;
                        try {
                            this._webview.render(result, `${item.rawTarget.title}-${client.rawClient.title}`, item.rawTarget.key);
                        }
                        catch (reason) {
                            vscode_1.window.showErrorMessage(reason);
                        }
                    }
                }
            }
            else {
                vscode_1.window.showInformationMessage('No available code snippet convert targets');
            }
        });
    }
    copy() {
        return __awaiter(this, void 0, void 0, function* () {
            if (this._convertedResult) {
                clipboardy.writeSync(this._convertedResult);
            }
        });
    }
    copyAsCurl() {
        return __awaiter(this, void 0, void 0, function* () {
            const editor = vscode_1.window.activeTextEditor;
            const document = workspaceUtility_1.getCurrentTextDocument();
            if (!editor || !document) {
                return;
            }
            // Get selected text of selected lines or full document
            let selectedText = new selector_1.Selector().getSelectedText(editor);
            if (!selectedText) {
                return;
            }
            // remove comment lines
            let lines = selectedText.split(Constants.LineSplitterRegex).filter(l => !Constants.CommentIdentifiersRegex.test(l));
            if (lines.length === 0 || lines.every(line => line === '')) {
                return;
            }
            // remove file variables definition lines
            selectedText = arrayUtility_1.ArrayUtility.skipWhile(lines, l => Constants.FileVariableDefinitionRegex.test(l) || l.trim() === '').join(os_1.EOL);
            // variables replacement
            selectedText = yield variableProcessor_1.VariableProcessor.processRawRequest(selectedText);
            // parse http request
            let httpRequest = new requestParserFactory_1.RequestParserFactory().createRequestParser(selectedText).parseHttpRequest(selectedText, document.fileName);
            if (!httpRequest) {
                return;
            }
            let harHttpRequest = this.convertToHARHttpRequest(httpRequest);
            let snippet = new HTTPSnippet(harHttpRequest);
            let result = snippet.convert('shell', 'curl', process.platform === 'win32' ? { indent: false } : {});
            clipboardy.writeSync(result);
        });
    }
    convertToHARHttpRequest(request) {
        // convert headers
        let headers = [];
        for (let key in request.headers) {
            let headerValue = request.headers[key];
            if (key.toLowerCase() === 'authorization') {
                headerValue = CodeSnippetController.normalizeAuthHeader(headerValue);
            }
            headers.push(new harHttpRequest_1.HARHeader(key, headerValue));
        }
        // convert cookie headers
        let cookies = [];
        let cookieHeader = headers.find(header => header.name.toLowerCase() === 'cookie');
        if (cookieHeader) {
            cookieHeader.value.split(';').forEach(pair => {
                let [headerName, headerValue = ''] = pair.split('=', 2);
                cookies.push(new harHttpRequest_1.HARCookie(headerName.trim(), headerValue.trim()));
            });
        }
        // convert body
        let body = null;
        if (request.body) {
            let contentTypeHeader = headers.find(header => header.name.toLowerCase() === 'content-type');
            let mimeType;
            if (contentTypeHeader) {
                mimeType = contentTypeHeader.value;
            }
            if (typeof request.body === 'string') {
                let normalizedBody = request.body.split(os_1.EOL).reduce((prev, cur) => prev.concat(cur.trim()), '');
                body = new harHttpRequest_1.HARPostData(mimeType, normalizedBody);
            }
            else {
                body = new harHttpRequest_1.HARPostData(mimeType, request.rawBody);
            }
        }
        return new harHttpRequest_1.HARHttpRequest(request.method, encodeUrl(request.url), headers, cookies, body);
    }
    dispose() {
        this._webview.dispose();
    }
    static normalizeAuthHeader(authHeader) {
        if (authHeader) {
            let start = authHeader.indexOf(' ');
            let scheme = authHeader.substr(0, start);
            if (scheme && scheme.toLowerCase() === 'basic') {
                let params = authHeader.substr(start).trim().split(' ');
                if (params.length === 2) {
                    return 'Basic ' + new Buffer(`${params[0]}:${params[1]}`).toString('base64');
                }
            }
        }
        return authHeader;
    }
}
CodeSnippetController._availableTargets = HTTPSnippet.availableTargets();
__decorate([
    decorator_1.trace('Copy Code Snippet')
], CodeSnippetController.prototype, "copy", null);
__decorate([
    decorator_1.trace('Copy Request As cURL')
], CodeSnippetController.prototype, "copyAsCurl", null);
exports.CodeSnippetController = CodeSnippetController;
//# sourceMappingURL=codeSnippetController.js.map