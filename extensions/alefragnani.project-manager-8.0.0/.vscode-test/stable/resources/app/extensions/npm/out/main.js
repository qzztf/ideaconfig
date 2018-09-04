/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
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
const httpRequest = require("request-light");
const vscode = require("vscode");
const jsonContributions_1 = require("./features/jsonContributions");
const npmView_1 = require("./npmView");
const tasks_1 = require("./tasks");
let taskProvider;
function activate(context) {
    return __awaiter(this, void 0, void 0, function* () {
        taskProvider = registerTaskProvider();
        registerExplorer(context);
        configureHttpRequest();
        vscode.workspace.onDidChangeConfiguration((e) => {
            configureHttpRequest();
            if (e.affectsConfiguration('npm.enableScriptExplorer')) {
                updateExplorerVisibility();
            }
        });
        context.subscriptions.push(jsonContributions_1.addJSONProviders(httpRequest.xhr));
    });
}
exports.activate = activate;
function registerTaskProvider() {
    if (vscode.workspace.workspaceFolders) {
        let provider = {
            provideTasks: () => {
                return tasks_1.provideNpmScripts();
            },
            resolveTask(_task) {
                return undefined;
            }
        };
        return vscode.workspace.registerTaskProvider('npm', provider);
    }
    return undefined;
}
function updateExplorerVisibility() {
    vscode.commands.executeCommand('setContext', 'showExplorer', tasks_1.explorerIsEnabled());
}
function registerExplorer(context) {
    return __awaiter(this, void 0, void 0, function* () {
        if (vscode.workspace.workspaceFolders) {
            let treeDataProvider = vscode.window.registerTreeDataProvider('npm', new npmView_1.NpmScriptsTreeDataProvider(context));
            context.subscriptions.push(treeDataProvider);
            updateExplorerVisibility();
        }
    });
}
function configureHttpRequest() {
    const httpSettings = vscode.workspace.getConfiguration('http');
    httpRequest.configure(httpSettings.get('proxy', ''), httpSettings.get('proxyStrictSSL', true));
}
function deactivate() {
    if (taskProvider) {
        taskProvider.dispose();
    }
}
exports.deactivate = deactivate;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\npm\out/main.js.map
