'use strict';
// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
const vscode = require("vscode");
const child_process = require("child_process");
// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
function activate(context) {
    // Use the console to output diagnostic information (console.log) and errors (console.error)
    // This line of code will only be executed once when your extension is activated
    // console.log('Congratulations, your extension "tortoise-svn-for-vscode" is now active!');
    // The command has been defined in the package.json file
    // Now provide the implementation of the command with  registerCommand
    // The commandId parameter must match the command field in package.json
    let actions = ['commit', 'diff', 'revert', 'update', 'add', 'rename', 'log', 'blame', 'lock', 'unlock'];
    let disposablePick = vscode.commands.registerCommand('svn.pick', (fileUri) => {
        vscode.window.showQuickPick(actions).then((param) => {
            if (param) {
                new SVNCommand(param, getPath(fileUri)).run();
            }
        });
    });
    let disposablePickRoot = vscode.commands.registerCommand('svn.pickroot', () => {
        vscode.window.showQuickPick(actions).then((param) => {
            if (param) {
                new SVNCommand(param, vscode.workspace.rootPath).run();
            }
        });
    });
    context.subscriptions.push(disposablePick);
    actions.forEach((action) => {
        let disposableAction = vscode.commands.registerCommand('svn.' + action, (fileUri) => {
            new SVNCommand(action, getPath(fileUri)).run();
        });
        context.subscriptions.push(disposableAction);
    });
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() {
}
exports.deactivate = deactivate;
let svnExecutable;
if (process.platform == 'win32') {
    svnExecutable = "\"C:\\Program Files\\TortoiseSVN\\bin\\TortoiseProc.exe\"";
    try {
        let ans = child_process.execSync("reg query HKEY_LOCAL_MACHINE\\SOFTWARE\\TortoiseSVN /v ProcPath | find /i \"ProcPath\"").toString().split("    ");
        svnExecutable = "\"" + ans[ans.length - 1].replace("\n", "") + "\"";
    }
    catch (error) {
        console.log(error);
    }
}
else {
    svnExecutable = "svn";
}
function getPath(fileUri) {
    let fileName = '';
    if (fileUri && fileUri.fsPath) {
        fileName = fileUri.fsPath;
    }
    else {
        if (!vscode.window.activeTextEditor || !vscode.window.activeTextEditor.document) {
            fileName = vscode.workspace.rootPath;
        }
        else {
            fileName = vscode.window.activeTextEditor.document.fileName;
        }
    }
    return fileName;
}
/**
 * SVNCommand
 */
class SVNCommand {
    constructor(action, path) {
        if (process.platform == 'win32') {
            this.command = svnExecutable + " /command:" + action + " /path:\"" + path + "\"";
        }
        else {
            this.command = svnExecutable + " " + action + " " + path;
        }
    }
    run() {
        child_process.exec(this.command, (error, stdout, stderr) => {
            if (error) {
                console.error(error);
            }
            if (stdout) {
                console.log(stdout);
            }
            if (stderr) {
                console.error(stderr);
            }
        });
    }
}
//# sourceMappingURL=extension.js.map