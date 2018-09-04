'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
const VSCode = require("vscode");
const commons = require("@pivotal-tools/commons-vscode");
var log_output = null;
const PIPELINE_LANGUAGE_ID = "concourse-pipeline-yaml";
const TASK_LANGUAGE_ID = "concourse-task-yaml";
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
        extensionId: 'vscode-concourse',
        jvmHeap: "48m",
        workspaceOptions: VSCode.workspace.getConfiguration("concourse.ls"),
        clientOptions: {
            documentSelector: [PIPELINE_LANGUAGE_ID, TASK_LANGUAGE_ID]
        }
    };
    let clientPromise = commons.activate(options, context);
}
exports.activate = activate;
//# sourceMappingURL=Main.js.map