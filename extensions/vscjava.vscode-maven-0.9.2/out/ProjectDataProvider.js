"use strict";
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const child_process = require("child_process");
const path = require("path");
const vscode_1 = require("vscode");
const vscode = require("vscode");
const FolderItem_1 = require("./model/FolderItem");
const ProjectItem_1 = require("./model/ProjectItem");
const WorkspaceItem_1 = require("./model/WorkspaceItem");
const Utils_1 = require("./Utils");
const VSCodeUI_1 = require("./VSCodeUI");
const ITEM_NO_AVAILABLE_PROJECTS = "No maven projects found.";
class ProjectDataProvider {
    constructor(context) {
        this._onDidChangeTreeData = new vscode_1.EventEmitter();
        this.onDidChangeTreeData = this._onDidChangeTreeData.event;
        this.cachedProjectItems = new Set();
        this.context = context;
    }
    getTreeItem(element) {
        return element;
    }
    getChildren(element) {
        return __awaiter(this, void 0, void 0, function* () {
            if (element === undefined) {
                this.cachedProjectItems.clear();
                if (vscode_1.workspace.workspaceFolders) {
                    return vscode_1.workspace.workspaceFolders.map((wf) => new WorkspaceItem_1.WorkspaceItem(wf.name, wf.uri.fsPath));
                }
                else {
                    return [];
                }
            }
            else if (element.contextValue === "WorkspaceItem") {
                const workspaceItem = element;
                const depth = vscode_1.workspace.getConfiguration("maven.projects").get("maxDepthOfPom");
                const exclusions = vscode_1.workspace.getConfiguration("maven.projects", vscode_1.Uri.file(workspaceItem.abosolutePath)).get("excludedFolders");
                const foundPomXmls = yield Utils_1.Utils.findAllInDir(workspaceItem.abosolutePath, "pom.xml", depth, exclusions);
                const promiseList = foundPomXmls.map((pomXmlFilePath) => Utils_1.Utils.getProject(pomXmlFilePath, workspaceItem.abosolutePath));
                const items = (yield Promise.all(promiseList)).filter((x) => x);
                items.forEach((item) => {
                    item.workspacePath = workspaceItem.abosolutePath;
                    if (!this.cachedProjectItems.has(item)) {
                        this.cachedProjectItems.add(item);
                    }
                });
                if (items.length === 0) {
                    return [new vscode_1.TreeItem(ITEM_NO_AVAILABLE_PROJECTS)];
                }
                return items;
            }
            else if (element.contextValue === "ProjectItem") {
                const projectItem = element;
                const items = [];
                // sub modules
                const pom = projectItem.params.pom;
                if (pom.project && pom.project.modules) {
                    const modulesFolderItem = new FolderItem_1.FolderItem("Modules", FolderItem_1.FolderItem.ContextValue.Modules, projectItem.abosolutePath, projectItem.workspacePath, Object.assign({}, projectItem.params, { modules: pom.project.modules }));
                    items.push(modulesFolderItem);
                }
                return items;
            }
            else if (element.contextValue === FolderItem_1.FolderItem.ContextValue.Modules) {
                const modulesFolderItem = element;
                const pomXmlFilePaths = [];
                modulesFolderItem.params.modules.forEach((modules) => {
                    if (modules.module) {
                        modules.module.forEach((mod) => {
                            const pomxml = path.join(path.dirname(modulesFolderItem.parentAbsolutePath), mod.toString(), "pom.xml");
                            pomXmlFilePaths.push(pomxml);
                        });
                    }
                });
                const promiseList = pomXmlFilePaths.map((pomXmlFilePath) => Utils_1.Utils.getProject(pomXmlFilePath, modulesFolderItem.workspacePath));
                const items = (yield Promise.all(promiseList)).filter((x) => x);
                items.forEach((item) => {
                    item.workspacePath = modulesFolderItem.workspacePath;
                });
                return items;
            }
            else {
                return [];
            }
        });
    }
    refreshTree() {
        this._onDidChangeTreeData.fire();
    }
    executeGoal(item, goal) {
        return __awaiter(this, void 0, void 0, function* () {
            if (item) {
                Utils_1.Utils.executeMavenCommand(goal, item.abosolutePath);
            }
        });
    }
    effectivePom(item) {
        return __awaiter(this, void 0, void 0, function* () {
            let pomXmlFilePath = null;
            if (item instanceof vscode_1.Uri) {
                pomXmlFilePath = item.fsPath;
            }
            else if (item instanceof ProjectItem_1.ProjectItem) {
                pomXmlFilePath = item.abosolutePath;
            }
            if (!pomXmlFilePath) {
                return;
            }
            const ret = yield vscode_1.window.withProgress({ location: vscode_1.ProgressLocation.Window }, (p) => new Promise((resolve, reject) => {
                p.report({ message: "Generating effective pom ... " });
                const filepath = Utils_1.Utils.getEffectivePomOutputPath(pomXmlFilePath);
                const cmd = [
                    Utils_1.Utils.getMavenExecutable(),
                    "help:effective-pom",
                    "-f",
                    `"${pomXmlFilePath}"`,
                    `-Doutput="${filepath}"`
                ].join(" ");
                const rootfolder = vscode_1.workspace.getWorkspaceFolder(vscode_1.Uri.file(pomXmlFilePath));
                const customEnv = VSCodeUI_1.VSCodeUI.setupEnvironment();
                const execOptions = {
                    cwd: rootfolder ? rootfolder.uri.fsPath : path.dirname(pomXmlFilePath),
                    env: Object.assign({}, process.env, customEnv)
                };
                child_process.exec(cmd, execOptions, (error, _stdout, _stderr) => {
                    if (error) {
                        vscode_1.window.showErrorMessage(`Error occurred in generating effective pom.\n${error}`);
                        reject(error);
                    }
                    else {
                        resolve(filepath);
                    }
                });
            }));
            const pomxml = yield Utils_1.Utils.readFileIfExists(ret);
            if (pomxml) {
                const document = yield vscode_1.workspace.openTextDocument({ language: "xml", content: pomxml });
                vscode_1.window.showTextDocument(document);
            }
        });
    }
    customGoal(item) {
        return __awaiter(this, void 0, void 0, function* () {
            if (!item || !item.abosolutePath) {
                return;
            }
            const inputGoals = yield vscode_1.window.showInputBox({ placeHolder: "e.g. clean package -DskipTests", ignoreFocusOut: true });
            const trimedGoals = inputGoals && inputGoals.trim();
            if (trimedGoals) {
                Utils_1.Utils.executeMavenCommand(trimedGoals, item.abosolutePath);
            }
        });
    }
    historicalGoals(projectPomPath) {
        return __awaiter(this, void 0, void 0, function* () {
            const selected = yield VSCodeUI_1.VSCodeUI.getQuickPick(Utils_1.Utils.getLRUCommands(projectPomPath), (x) => x.command, null, (x) => x.pomfile, { placeHolder: "Select from history ... " });
            if (selected) {
                const command = selected.command;
                const pomfile = selected.pomfile;
                Utils_1.Utils.executeMavenCommand(command, pomfile);
            }
        });
    }
    execute() {
        return __awaiter(this, void 0, void 0, function* () {
            // select a project(pomfile)
            const item = yield VSCodeUI_1.VSCodeUI.getQuickPick(Array.from(this.cachedProjectItems.values()), (x) => `$(primitive-dot) ${x.label}`, null, (x) => x.abosolutePath, { placeHolder: "Select a Maven project." });
            if (!item) {
                return;
            }
            // select a command
            const command = yield VSCodeUI_1.VSCodeUI.getQuickPick(["custom", "clean", "validate", "compile", "test", "package", "verify", "install", "site", "deploy"], (x) => x === "custom" ? "Custom goals ..." : x, null, null, { placeHolder: "Select the goal to execute." });
            if (!command) {
                return;
            }
            // execute
            yield vscode.commands.executeCommand(`maven.goal.${command}`, item);
        });
    }
}
exports.ProjectDataProvider = ProjectDataProvider;
//# sourceMappingURL=ProjectDataProvider.js.map