// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const vscode_extension_telemetry_wrapper_1 = require("vscode-extension-telemetry-wrapper");
const ArchetypeModule_1 = require("./ArchetypeModule");
const ProjectDataProvider_1 = require("./ProjectDataProvider");
const Utils_1 = require("./Utils");
const VSCodeUI_1 = require("./VSCodeUI");
function activate(context) {
    return __awaiter(this, void 0, void 0, function* () {
        yield Utils_1.Utils.loadPackageInfo(context);
        // Usage data statistics.
        if (Utils_1.Utils.getAiKey()) {
            vscode_extension_telemetry_wrapper_1.TelemetryWrapper.initilize(Utils_1.Utils.getExtensionPublisher(), Utils_1.Utils.getExtensionName(), Utils_1.Utils.getExtensionVersion(), Utils_1.Utils.getAiKey());
        }
        const mavenProjectsTreeDataProvider = new ProjectDataProvider_1.ProjectDataProvider(context);
        vscode.window.registerTreeDataProvider("mavenProjects", mavenProjectsTreeDataProvider);
        // pom.xml listener to refresh tree view
        const watcher = vscode.workspace.createFileSystemWatcher("**/pom.xml");
        watcher.onDidCreate(() => mavenProjectsTreeDataProvider.refreshTree());
        watcher.onDidChange(() => mavenProjectsTreeDataProvider.refreshTree());
        watcher.onDidDelete(() => mavenProjectsTreeDataProvider.refreshTree());
        context.subscriptions.push(watcher);
        // register commands.
        ["clean", "validate", "compile", "test", "package", "verify", "install", "site", "deploy"].forEach((goal) => {
            context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand(`maven.goal.${goal}`, (item) => __awaiter(this, void 0, void 0, function* () {
                yield mavenProjectsTreeDataProvider.executeGoal(item, goal);
            })));
        });
        context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand("maven.project.refreshAll", () => {
            mavenProjectsTreeDataProvider.refreshTree();
        }));
        context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand("maven.project.effectivePom", (item) => __awaiter(this, void 0, void 0, function* () {
            yield mavenProjectsTreeDataProvider.effectivePom(item);
        })));
        context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand("maven.goal.custom", (item) => __awaiter(this, void 0, void 0, function* () {
            yield mavenProjectsTreeDataProvider.customGoal(item);
        })));
        context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand("maven.project.openPom", (item) => __awaiter(this, void 0, void 0, function* () {
            if (item) {
                yield VSCodeUI_1.VSCodeUI.openFileIfExists(item.abosolutePath);
            }
        })));
        context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand("maven.archetype.generate", (entry) => __awaiter(this, void 0, void 0, function* () {
            yield ArchetypeModule_1.ArchetypeModule.generateFromArchetype(entry);
        })));
        context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand("maven.archetype.update", () => __awaiter(this, void 0, void 0, function* () {
            yield vscode.window.withProgress({ location: vscode.ProgressLocation.Window }, (p) => __awaiter(this, void 0, void 0, function* () {
                p.report({ message: "updating archetype catalog ..." });
                yield ArchetypeModule_1.ArchetypeModule.updateArchetypeCatalog();
                p.report({ message: "finished." });
            }));
        })));
        context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand("maven.history", (item) => __awaiter(this, void 0, void 0, function* () {
            yield mavenProjectsTreeDataProvider.historicalGoals(item && item.abosolutePath);
        })));
        context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand("maven.goal.execute", () => __awaiter(this, void 0, void 0, function* () {
            yield mavenProjectsTreeDataProvider.execute();
        })));
        context.subscriptions.push(vscode.window.onDidCloseTerminal((closedTerminal) => {
            VSCodeUI_1.VSCodeUI.onDidCloseTerminal(closedTerminal);
        }));
        // configuration change listener
        vscode.workspace.onDidChangeConfiguration((e) => {
            // close all terminals with outdated JAVA related Envs
            if (e.affectsConfiguration("maven.terminal.useJavaHome") || e.affectsConfiguration("maven.terminal.customEnv")) {
                VSCodeUI_1.VSCodeUI.closeAllTerminals();
            }
            else {
                const useJavaHome = vscode.workspace.getConfiguration("maven").get("terminal.useJavaHome");
                if (useJavaHome && e.affectsConfiguration("java.home")) {
                    VSCodeUI_1.VSCodeUI.closeAllTerminals();
                }
            }
            checkMavenAvailablility();
        });
        // check maven executable file
        checkMavenAvailablility();
    });
}
exports.activate = activate;
function deactivate() {
    // this method is called when your extension is deactivated
}
exports.deactivate = deactivate;
// private helpers
function checkMavenAvailablility() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            if (vscode.workspace.workspaceFolders) {
                yield Utils_1.Utils.getMavenVersion();
            }
        }
        catch (error) {
            const OPTION_SHOW_FAQS = "Show FAQs";
            const OPTION_OPEN_SETTINGS = "Open Settings";
            const MESSAGE_MAVEN_ERROR = "Unable to execute Maven commands.";
            const choiceForDetails = yield vscode.window.showErrorMessage(`${MESSAGE_MAVEN_ERROR}\nError:\n${error.message}`, OPTION_OPEN_SETTINGS, OPTION_SHOW_FAQS);
            if (choiceForDetails === OPTION_SHOW_FAQS) {
                // open FAQs
                const readmeFilePath = Utils_1.Utils.getPathToExtensionRoot("FAQs.md");
                vscode.commands.executeCommand("markdown.showPreview", vscode.Uri.file(readmeFilePath));
            }
            else if (choiceForDetails === OPTION_OPEN_SETTINGS) {
                vscode.commands.executeCommand("workbench.action.openSettings");
            }
        }
    });
}
//# sourceMappingURL=extension.js.map