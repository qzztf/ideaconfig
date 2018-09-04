'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
const VSCode = require("vscode");
const commons = require("@pivotal-tools/commons-vscode");
var log_output = null;
function log(msg) {
    if (log_output) {
        log_output.append(msg + "\n");
    }
}
function error(msg) {
    if (log_output) {
        log_output.append("ERR: " + msg + "\n");
    }
}
/** Called when extension is activated */
function activate(context) {
    let options = {
        DEBUG: false,
        CONNECT_TO_LS: false,
        extensionId: 'vscode-manifest-yaml',
        workspaceOptions: VSCode.workspace.getConfiguration("cloudfoundry-manifest.ls"),
        jvmHeap: '64m',
        clientOptions: {
            documentSelector: ["manifest-yaml"]
        }
    };
    commons.activate(options, context);
}
exports.activate = activate;
//# sourceMappingURL=Main.js.map