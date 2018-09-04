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
const path = require("path");
const vscode_1 = require("vscode");
const jsonc_parser_1 = require("jsonc-parser");
const tasks_1 = require("./tasks");
const nls = require("vscode-nls");
const localize = nls.loadMessageBundle(__filename);
class Folder extends vscode_1.TreeItem {
    constructor(folder) {
        super(folder.name, vscode_1.TreeItemCollapsibleState.Expanded);
        this.packages = [];
        this.contextValue = 'folder';
        this.resourceUri = folder.uri;
        this.workspaceFolder = folder;
        this.iconPath = vscode_1.ThemeIcon.Folder;
    }
    addPackage(packageJson) {
        this.packages.push(packageJson);
    }
}
const packageName = 'package.json';
class PackageJSON extends vscode_1.TreeItem {
    constructor(folder, relativePath) {
        super(PackageJSON.getLabel(folder.label, relativePath), vscode_1.TreeItemCollapsibleState.Expanded);
        this.scripts = [];
        this.folder = folder;
        this.path = relativePath;
        this.contextValue = 'packageJSON';
        if (relativePath) {
            this.resourceUri = vscode_1.Uri.file(path.join(folder.resourceUri.fsPath, relativePath, packageName));
        }
        else {
            this.resourceUri = vscode_1.Uri.file(path.join(folder.resourceUri.fsPath, packageName));
        }
        this.iconPath = vscode_1.ThemeIcon.File;
    }
    static getLabel(folderName, relativePath) {
        if (relativePath.length > 0) {
            return path.join(relativePath, packageName);
        }
        return path.join(folderName, packageName);
    }
    addScript(script) {
        this.scripts.push(script);
    }
}
class NpmScript extends vscode_1.TreeItem {
    constructor(context, packageJson, task) {
        super(task.name, vscode_1.TreeItemCollapsibleState.None);
        this.contextValue = 'script';
        this.package = packageJson;
        this.task = task;
        this.command = {
            title: 'Run Script',
            command: 'npm.openScript',
            arguments: [this]
        };
        this.iconPath = {
            light: context.asAbsolutePath(path.join('resources', 'light', 'script.svg')),
            dark: context.asAbsolutePath(path.join('resources', 'dark', 'script.svg'))
        };
    }
    getFolder() {
        return this.package.folder.workspaceFolder;
    }
}
class NpmScriptsTreeDataProvider {
    constructor(context) {
        this.taskTree = null;
        this._onDidChangeTreeData = new vscode_1.EventEmitter();
        this.onDidChangeTreeData = this._onDidChangeTreeData.event;
        const subscriptions = context.subscriptions;
        this.extensionContext = context;
        subscriptions.push(vscode_1.commands.registerCommand('npm.runScript', this.runScript, this));
        subscriptions.push(vscode_1.commands.registerCommand('npm.debugScript', this.debugScript, this));
        subscriptions.push(vscode_1.commands.registerCommand('npm.openScript', this.openScript, this));
        subscriptions.push(vscode_1.commands.registerCommand('npm.refresh', this.refresh, this));
    }
    scriptIsValid(scripts, task) {
        for (const script in scripts) {
            let label = tasks_1.getTaskName(script, task.definition.path);
            if (task.name === label) {
                return true;
            }
        }
        return false;
    }
    runScript(script) {
        return __awaiter(this, void 0, void 0, function* () {
            let task = script.task;
            let uri = tasks_1.getPackageJsonUriFromTask(task);
            let scripts = yield tasks_1.getScripts(uri);
            if (!this.scriptIsValid(scripts, task)) {
                this.scriptNotValid(task);
                return;
            }
            vscode_1.workspace.executeTask(script.task);
        });
    }
    extractDebugArg(scripts, task) {
        return __awaiter(this, void 0, void 0, function* () {
            let script = scripts[task.name];
            let match = script.match(/--(inspect|debug)(-brk)?(=(\d*))?/);
            if (match) {
                if (match[4]) {
                    return [match[1], parseInt(match[4])];
                }
                if (match[1] === 'inspect') {
                    return [match[1], 9229];
                }
                if (match[1] === 'debug') {
                    return [match[1], 5858];
                }
            }
            return undefined;
        });
    }
    debugScript(script) {
        return __awaiter(this, void 0, void 0, function* () {
            let task = script.task;
            let uri = tasks_1.getPackageJsonUriFromTask(task);
            let scripts = yield tasks_1.getScripts(uri);
            if (!this.scriptIsValid(scripts, task)) {
                this.scriptNotValid(task);
                return;
            }
            let debugArg = yield this.extractDebugArg(scripts, task);
            if (!debugArg) {
                let message = localize(0, null, task.name);
                let learnMore = localize(1, null);
                let ok = localize(2, null);
                let result = yield vscode_1.window.showErrorMessage(message, { modal: true }, ok, learnMore);
                if (result === learnMore) {
                    vscode_1.commands.executeCommand('vscode.open', vscode_1.Uri.parse('https://code.visualstudio.com/docs/nodejs/nodejs-debugging#_launch-configuration-support-for-npm-and-other-tools'));
                }
                return;
            }
            let protocol = 'inspector';
            if (debugArg[0] === 'debug') {
                protocol = 'legacy';
            }
            let packageManager = tasks_1.getPackageManager(script.getFolder());
            const config = {
                type: 'node',
                request: 'launch',
                name: `Debug ${task.name}`,
                runtimeExecutable: packageManager,
                runtimeArgs: [
                    'run-script',
                    task.name,
                ],
                port: debugArg[1],
                protocol: protocol
            };
            if (tasks_1.isWorkspaceFolder(task.scope)) {
                vscode_1.debug.startDebugging(task.scope, config);
            }
        });
    }
    scriptNotValid(task) {
        let message = localize(3, null, task.name);
        vscode_1.window.showErrorMessage(message);
    }
    findScript(document, script) {
        let scriptOffset = 0;
        let inScripts = false;
        let visitor = {
            onError() {
                return scriptOffset;
            },
            onObjectEnd() {
                if (inScripts) {
                    inScripts = false;
                }
            },
            onObjectProperty(property, offset, _length) {
                if (property === 'scripts') {
                    inScripts = true;
                    if (!script) { // select the script section
                        scriptOffset = offset;
                    }
                }
                else if (inScripts && script) {
                    let label = tasks_1.getTaskName(property, script.task.definition.path);
                    if (script.task.name === label) {
                        scriptOffset = offset;
                    }
                }
            }
        };
        jsonc_parser_1.visit(document.getText(), visitor);
        return scriptOffset;
    }
    openScript(selection) {
        return __awaiter(this, void 0, void 0, function* () {
            let uri = undefined;
            if (selection instanceof PackageJSON) {
                uri = selection.resourceUri;
            }
            else if (selection instanceof NpmScript) {
                uri = selection.package.resourceUri;
            }
            if (!uri) {
                return;
            }
            let document = yield vscode_1.workspace.openTextDocument(uri);
            let offset = this.findScript(document, selection instanceof NpmScript ? selection : undefined);
            let position = document.positionAt(offset);
            yield vscode_1.window.showTextDocument(document, { selection: new vscode_1.Selection(position, position) });
        });
    }
    refresh() {
        this.taskTree = null;
        this._onDidChangeTreeData.fire();
    }
    getTreeItem(element) {
        return element;
    }
    getParent(element) {
        if (element instanceof Folder) {
            return null;
        }
        if (element instanceof PackageJSON) {
            return element.folder;
        }
        if (element instanceof NpmScript) {
            return element.package;
        }
        return null;
    }
    getChildren(element) {
        return __awaiter(this, void 0, void 0, function* () {
            if (!this.taskTree) {
                let tasks = yield vscode_1.workspace.fetchTasks({ type: 'npm' });
                if (tasks) {
                    this.taskTree = this.buildTaskTree(tasks);
                }
            }
            if (element instanceof Folder) {
                return element.packages;
            }
            if (element instanceof PackageJSON) {
                return element.scripts;
            }
            if (element instanceof NpmScript) {
                return [];
            }
            if (!element) {
                if (this.taskTree) {
                    return this.taskTree;
                }
            }
            return [];
        });
    }
    buildTaskTree(tasks) {
        let folders = new Map();
        let packages = new Map();
        let folder = null;
        let packageJson = null;
        tasks.forEach(each => {
            if (tasks_1.isWorkspaceFolder(each.scope) && each.name !== 'install') {
                folder = folders.get(each.scope.name);
                if (!folder) {
                    folder = new Folder(each.scope);
                    folders.set(each.scope.name, folder);
                }
                let definition = each.definition;
                let relativePath = definition.path ? definition.path : '';
                let fullPath = path.join(each.scope.name, relativePath);
                packageJson = packages.get(fullPath);
                if (!packageJson) {
                    packageJson = new PackageJSON(folder, relativePath);
                    folder.addPackage(packageJson);
                    packages.set(fullPath, packageJson);
                }
                let script = new NpmScript(this.extensionContext, packageJson, each);
                packageJson.addScript(script);
            }
        });
        if (folders.size === 1) {
            return [...packages.values()];
        }
        return [...folders.values()];
    }
}
exports.NpmScriptsTreeDataProvider = NpmScriptsTreeDataProvider;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\npm\out/npmView.js.map
