"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const path = require("path");
function getWorkspaceRootPath() {
    let editor = vscode_1.window.activeTextEditor;
    if (editor && editor.document) {
        let fileUri = vscode_1.window.activeTextEditor.document.uri;
        let workspaceFolder = vscode_1.workspace.getWorkspaceFolder(fileUri);
        if (workspaceFolder) {
            return workspaceFolder.uri.toString();
        }
    }
}
exports.getWorkspaceRootPath = getWorkspaceRootPath;
function getCurrentHttpFileName() {
    let editor = vscode_1.window.activeTextEditor;
    if (editor && editor.document) {
        let filePath = vscode_1.window.activeTextEditor.document.fileName;
        return path.basename(filePath, path.extname(filePath));
    }
}
exports.getCurrentHttpFileName = getCurrentHttpFileName;
//# sourceMappingURL=workspaceUtility.js.map