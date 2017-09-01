'use strict';
// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
var vscode = require('vscode');
var child_process = require('child_process');
var path = require('path');
var fs = require('fs');
var glob = require('glob');
var DIRECTORY_ACTIONS = ['update', 'commit', 'revert', 'cleanup', 'log', 'add', 'diff', 'lock', 'unlock'];
var FILE_ACTIONS = ['update', 'commit', 'revert', 'cleanup', 'log', 'add', 'blame', 'diff', 'lock', 'unlock'];
// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
function activate(context) {
    // Use the console to output diagnostic information (console.log) and errors (console.error)
    // This line of code will only be executed once when your extension is activated
    // console.log('Congratulations, your extension "tortoisesvn" is now active!');
    // The command has been defined in the package.json file
    // Now provide the implementation of the command with  registerCommand
    // The commandId parameter must match the command field in package.json
    /* add command tortoiseSVN actions that only useful workspace(vscode.workspace.rootPath)*/
    var tortoiseCommand = new TortoiseCommand();
    DIRECTORY_ACTIONS.forEach(function (action) {
        var disposable = vscode.commands.registerCommand("workspace tortoise-svn " + action, function () {
            tortoiseCommand.exec(action, vscode.workspace.rootPath);
        });
        context.subscriptions.push(disposable);
    });
    FILE_ACTIONS.forEach(function (action) {
        var disposable = vscode.commands.registerCommand("file tortoise-svn " + action, function () {
            var path = vscode.window.activeTextEditor && vscode.window.activeTextEditor.document.uri.fsPath;
            if (!path) {
                vscode.window.showWarningMessage('only can be used when open a file on text editor');
                return;
            }
            else {
                tortoiseCommand.exec(action, path);
            }
        });
        context.subscriptions.push(disposable);
    });
    /* add command tortoise-svn... that need something choose*/
    var actionQuickPickItems = FILE_ACTIONS.map(function (action) {
        return {
            label: 'svn ' + action,
            description: '',
            action: action
        };
    });
    var disposableNeedChoose = vscode.commands.registerCommand('tortoise-svn ...', function (uri) {
        var uriInfo = new UriInfo(uri && uri.fsPath);
        var actionQuickPickItems = uriInfo.getActionQuickPickItem();
        vscode.window.showQuickPick(actionQuickPickItems).then(function (quickPickItem) {
            if (quickPickItem) {
                tortoiseCommand.exec(quickPickItem.action, quickPickItem.path);
            }
        });
    });
    context.subscriptions.push(disposableNeedChoose);
    var disposableDropdown = vscode.commands.registerCommand('tortoise-svn ...(select path)', function (uri) {
        // exec every time on command trigger
        getQuickPickItemsFromDir(vscode.workspace.rootPath).then(function (quickPickItems) {
            return vscode.window.showQuickPick(quickPickItems);
        }).then(function (path) {
            if (!path) {
                return;
            }
            var uriInfo = new UriInfo(path.path);
            var actionQuickPickItems = uriInfo.getActionQuickPickItem();
            vscode.window.showQuickPick(actionQuickPickItems).then(function (action) {
                if (action) {
                    tortoiseCommand.exec(action.action, action.path);
                }
            });
        });
        context.subscriptions.push(disposableDropdown);
    });
}
exports.activate = activate;
/**
 * 获取目录下的所有文件夹和文件的绝对路径
 *
 * @param {string} dirPath
 * @param {Function} callback
 */
function getQuickPickItemsFromDir(dirPath) {
    return new Promise(function (resolve, reject) {
        var quickPickItems = [{
                label: dirPath,
                description: dirPath,
                path: dirPath
            }];
        var ignore = vscode.workspace.getConfiguration('TortoiseSVN').get('showPath.exclude');
        var options = { cwd: dirPath, mark: true };
        if (Object.prototype.toString.call(ignore) === '[object Array]' && ignore.length > 0) {
            options.ignore = ignore;
        }
        glob('**', options, function (err, paths) {
            if (err)
                throw err;
            paths.forEach(function (file) {
                var lastSep = file.lastIndexOf('/') + 1;
                if (lastSep === file.length) {
                    lastSep = 0;
                }
                quickPickItems.push({
                    label: file.substring(lastSep),
                    description: file.substr(0, lastSep),
                    path: path.join(vscode.workspace.rootPath, file)
                });
            });
            resolve(quickPickItems);
        });
    });
}
// this method is called when your extension is deactivated
function deactivate() {
}
exports.deactivate = deactivate;
var UriInfo = (function () {
    function UriInfo(uri) {
        var path;
        if (uri) {
            path = uri;
        }
        else {
            path = vscode.workspace.rootPath;
        }
        var stat = fs.statSync(path);
        Object.assign(this, {
            path: path,
            isFile: stat.isFile(),
            isDirectory: stat.isDirectory()
        });
    }
    UriInfo.prototype.getActionQuickPickItem = function () {
        var _this = this;
        var quickPickItems;
        if (this.isFile) {
            quickPickItems = FILE_ACTIONS;
        }
        else if (this.isDirectory) {
            quickPickItems = DIRECTORY_ACTIONS;
        }
        return quickPickItems.map(function (action) {
            return {
                label: 'svn ' + action,
                description: _this.path,
                path: _this.path,
                action: action
            };
        });
    };
    return UriInfo;
}());
var TortoiseCommand = (function () {
    function TortoiseCommand() {
        this.tortoiseSVNProcExePath = this._getTortoiseSVNProcExePath();
    }
    TortoiseCommand.prototype.tortoiseSVNProcExePathIsExist = function () {
        try {
            var stat = fs.statSync(this.tortoiseSVNProcExePath);
            return stat.isFile();
        }
        catch (err) {
            return false;
        }
    };
    TortoiseCommand.prototype._getTortoiseSVNProcExePath = function () {
        var tortoiseSVNProcExePath = vscode.workspace.getConfiguration('TortoiseSVN').get('tortoiseSVNProcExePath').toString();
        if (!tortoiseSVNProcExePath) {
            console.log('detect tortoiseSVNProcExePath');
            try {
                var result = child_process.execSync("reg query HKEY_LOCAL_MACHINE\\SOFTWARE\\TortoiseSVN /v ProcPath | find /i \"ProcPath\"").toString();
                tortoiseSVNProcExePath = "" + result.match(/\w:.+\.exe/)[0];
            }
            catch (error) {
                console.log(error);
            }
        }
        return tortoiseSVNProcExePath;
    };
    TortoiseCommand.prototype._getTargetPath = function (fileUri) {
        var path = '';
        if (fileUri) {
            path = fileUri;
        }
        else {
            if (!vscode.window.activeTextEditor || !vscode.window.activeTextEditor.document) {
                path = vscode.workspace.rootPath;
            }
            else {
                path = vscode.window.activeTextEditor.document.fileName;
            }
        }
        return path;
    };
    TortoiseCommand.prototype._getCommand = function (action, fileUri) {
        var closeonend = vscode.workspace.getConfiguration('TortoiseSVN').get('autoCloseUpdateDialog') ? 3 : 0;
        // todo: Send line number with blame command. https://tortoisesvn.net/docs/release/TortoiseSVN_en/tsvn-automation.html
        return "\"" + this.tortoiseSVNProcExePath + "\" /command:" + action + " /path:\"" + this._getTargetPath(fileUri) + "\" /closeonend:" + closeonend;
    };
    TortoiseCommand.prototype.exec = function (action, fileUri) {
        var _this = this;
        var allFileSave;
        // Can't revert unsaved changes.
        if (action === "revert") {
            allFileSave = vscode.workspace.saveAll();
        }
        else {
            allFileSave = Promise.resolve();
        }
        allFileSave.then(function () {
            child_process.exec(_this._getCommand(action, fileUri), function (error, stdout, stderr) {
                if (error && !_this.tortoiseSVNProcExePathIsExist()) {
                    vscode.window.showErrorMessage("Setting \"TortoiseSVN.tortoiseSVNProcExePath\" is invalid. Please specify a correct one, then restar VSCode.");
                    console.log(error);
                    console.log(stdout);
                    console.log(stderr);
                }
            });
        });
    };
    return TortoiseCommand;
}());
//# sourceMappingURL=extension.js.map