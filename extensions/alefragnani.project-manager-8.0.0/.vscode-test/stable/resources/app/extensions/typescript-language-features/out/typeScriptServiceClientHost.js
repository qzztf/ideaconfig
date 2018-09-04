"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
/* --------------------------------------------------------------------------------------------
 * Includes code from typescript-sublime-plugin project, obtained from
 * https://github.com/Microsoft/TypeScript-Sublime-Plugin/blob/master/TypeScript%20Indent.tmPreferences
 * ------------------------------------------------------------------------------------------ */
const vscode_1 = require("vscode");
const PConst = require("./protocol.const");
const typescriptServiceClient_1 = require("./typescriptServiceClient");
const languageProvider_1 = require("./languageProvider");
const typingsStatus_1 = require("./utils/typingsStatus");
const versionStatus_1 = require("./utils/versionStatus");
const typeConverters = require("./utils/typeConverters");
const dipose_1 = require("./utils/dipose");
// Style check diagnostics that can be reported as warnings
const styleCheckDiagnostics = [
    6133,
    6138,
    7027,
    7028,
    7029,
    7030 // not all code paths return a value
];
class TypeScriptServiceClientHost {
    constructor(descriptions, workspaceState, plugins, commandManager, logDirectoryProvider) {
        this.commandManager = commandManager;
        this.languages = [];
        this.languagePerId = new Map();
        this.disposables = [];
        this.reportStyleCheckAsWarnings = true;
        const handleProjectCreateOrDelete = () => {
            this.client.execute('reloadProjects', null, false);
            this.triggerAllDiagnostics();
        };
        const handleProjectChange = () => {
            setTimeout(() => {
                this.triggerAllDiagnostics();
            }, 1500);
        };
        const configFileWatcher = vscode_1.workspace.createFileSystemWatcher('**/[tj]sconfig.json');
        this.disposables.push(configFileWatcher);
        configFileWatcher.onDidCreate(handleProjectCreateOrDelete, this, this.disposables);
        configFileWatcher.onDidDelete(handleProjectCreateOrDelete, this, this.disposables);
        configFileWatcher.onDidChange(handleProjectChange, this, this.disposables);
        this.client = new typescriptServiceClient_1.default(workspaceState, version => this.versionStatus.onDidChangeTypeScriptVersion(version), plugins, logDirectoryProvider);
        this.disposables.push(this.client);
        this.client.onDiagnosticsReceived(({ kind, resource, diagnostics }) => {
            this.diagnosticsReceived(kind, resource, diagnostics);
        }, null, this.disposables);
        this.client.onConfigDiagnosticsReceived(diag => this.configFileDiagnosticsReceived(diag), null, this.disposables);
        this.client.onResendModelsRequested(() => this.populateService(), null, this.disposables);
        this.versionStatus = new versionStatus_1.default(resource => this.client.normalizePath(resource));
        this.disposables.push(this.versionStatus);
        this.typingsStatus = new typingsStatus_1.default(this.client);
        this.ataProgressReporter = new typingsStatus_1.AtaProgressReporter(this.client);
        for (const description of descriptions) {
            const manager = new languageProvider_1.default(this.client, description, this.commandManager, this.typingsStatus);
            this.languages.push(manager);
            this.disposables.push(manager);
            this.languagePerId.set(description.id, manager);
        }
        this.client.ensureServiceStarted();
        this.client.onReady(() => {
            if (!this.client.apiVersion.has230Features()) {
                return;
            }
            const languages = new Set();
            for (const plugin of plugins) {
                for (const language of plugin.languages) {
                    languages.add(language);
                }
            }
            if (languages.size) {
                const description = {
                    id: 'typescript-plugins',
                    modeIds: Array.from(languages.values()),
                    diagnosticSource: 'ts-plugins',
                    isExternal: true
                };
                const manager = new languageProvider_1.default(this.client, description, this.commandManager, this.typingsStatus);
                this.languages.push(manager);
                this.disposables.push(manager);
                this.languagePerId.set(description.id, manager);
            }
        });
        this.client.onTsServerStarted(() => {
            this.triggerAllDiagnostics();
        });
        vscode_1.workspace.onDidChangeConfiguration(this.configurationChanged, this, this.disposables);
        this.configurationChanged();
    }
    dispose() {
        dipose_1.disposeAll(this.disposables);
        this.typingsStatus.dispose();
        this.ataProgressReporter.dispose();
    }
    get serviceClient() {
        return this.client;
    }
    reloadProjects() {
        this.client.execute('reloadProjects', null, false);
        this.triggerAllDiagnostics();
    }
    handles(resource) {
        return !!this.findLanguage(resource);
    }
    configurationChanged() {
        const config = vscode_1.workspace.getConfiguration('typescript');
        this.reportStyleCheckAsWarnings = config.get('reportStyleChecksAsWarnings', true);
    }
    async findLanguage(resource) {
        try {
            const doc = await vscode_1.workspace.openTextDocument(resource);
            return this.languages.find(language => language.handles(resource, doc));
        }
        catch (_a) {
            return undefined;
        }
    }
    triggerAllDiagnostics() {
        for (const language of this.languagePerId.values()) {
            language.triggerAllDiagnostics();
        }
    }
    populateService() {
        // See https://github.com/Microsoft/TypeScript/issues/5530
        vscode_1.workspace.saveAll(false).then(() => {
            for (const language of this.languagePerId.values()) {
                language.reInitialize();
            }
        });
    }
    async diagnosticsReceived(kind, resource, diagnostics) {
        const language = await this.findLanguage(resource);
        if (language) {
            language.diagnosticsReceived(kind, resource, this.createMarkerDatas(diagnostics, language.diagnosticSource));
        }
    }
    configFileDiagnosticsReceived(event) {
        // See https://github.com/Microsoft/TypeScript/issues/10384
        const body = event.body;
        if (!body || !body.diagnostics || !body.configFile) {
            return;
        }
        (this.findLanguage(this.client.asUrl(body.configFile))).then(language => {
            if (!language) {
                return;
            }
            if (body.diagnostics.length === 0) {
                language.configFileDiagnosticsReceived(this.client.asUrl(body.configFile), []);
            }
            else if (body.diagnostics.length >= 1) {
                vscode_1.workspace.openTextDocument(vscode_1.Uri.file(body.configFile)).then((document) => {
                    let curly = undefined;
                    let nonCurly = undefined;
                    let diagnostic;
                    for (let index = 0; index < document.lineCount; index++) {
                        const line = document.lineAt(index);
                        const text = line.text;
                        const firstNonWhitespaceCharacterIndex = line.firstNonWhitespaceCharacterIndex;
                        if (firstNonWhitespaceCharacterIndex < text.length) {
                            if (text.charAt(firstNonWhitespaceCharacterIndex) === '{') {
                                curly = [index, firstNonWhitespaceCharacterIndex, firstNonWhitespaceCharacterIndex + 1];
                                break;
                            }
                            else {
                                const matches = /\s*([^\s]*)(?:\s*|$)/.exec(text.substr(firstNonWhitespaceCharacterIndex));
                                if (matches && matches.length >= 1) {
                                    nonCurly = [index, firstNonWhitespaceCharacterIndex, firstNonWhitespaceCharacterIndex + matches[1].length];
                                }
                            }
                        }
                    }
                    const match = curly || nonCurly;
                    if (match) {
                        diagnostic = new vscode_1.Diagnostic(new vscode_1.Range(match[0], match[1], match[0], match[2]), body.diagnostics[0].text);
                    }
                    else {
                        diagnostic = new vscode_1.Diagnostic(new vscode_1.Range(0, 0, 0, 0), body.diagnostics[0].text);
                    }
                    if (diagnostic) {
                        diagnostic.source = language.diagnosticSource;
                        language.configFileDiagnosticsReceived(this.client.asUrl(body.configFile), [diagnostic]);
                    }
                }, _error => {
                    language.configFileDiagnosticsReceived(this.client.asUrl(body.configFile), [new vscode_1.Diagnostic(new vscode_1.Range(0, 0, 0, 0), body.diagnostics[0].text)]);
                });
            }
        });
    }
    createMarkerDatas(diagnostics, source) {
        return diagnostics.map(tsDiag => this.tsDiagnosticToVsDiagnostic(tsDiag, source));
    }
    tsDiagnosticToVsDiagnostic(diagnostic, source) {
        const { start, end, text } = diagnostic;
        const range = new vscode_1.Range(typeConverters.Position.fromLocation(start), typeConverters.Position.fromLocation(end));
        const converted = new vscode_1.Diagnostic(range, text);
        converted.severity = this.getDiagnosticSeverity(diagnostic);
        converted.source = diagnostic.source || source;
        if (diagnostic.code) {
            converted.code = diagnostic.code;
        }
        return converted;
    }
    getDiagnosticSeverity(diagnostic) {
        if (this.reportStyleCheckAsWarnings
            && this.isStyleCheckDiagnostic(diagnostic.code)
            && diagnostic.category === PConst.DiagnosticCategory.error) {
            return vscode_1.DiagnosticSeverity.Warning;
        }
        switch (diagnostic.category) {
            case PConst.DiagnosticCategory.error:
                return vscode_1.DiagnosticSeverity.Error;
            case PConst.DiagnosticCategory.warning:
                return vscode_1.DiagnosticSeverity.Warning;
            case PConst.DiagnosticCategory.suggestion:
                return vscode_1.DiagnosticSeverity.Hint;
            default:
                return vscode_1.DiagnosticSeverity.Error;
        }
    }
    isStyleCheckDiagnostic(code) {
        return code ? styleCheckDiagnostics.indexOf(code) !== -1 : false;
    }
}
exports.default = TypeScriptServiceClientHost;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/typeScriptServiceClientHost.js.map
