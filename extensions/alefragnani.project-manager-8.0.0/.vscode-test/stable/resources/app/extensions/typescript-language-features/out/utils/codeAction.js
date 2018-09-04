"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const typeConverters = require("./typeConverters");
function getEditForCodeAction(client, action) {
    return action.changes && action.changes.length
        ? typeConverters.WorkspaceEdit.fromFromFileCodeEdits(client, action.changes)
        : undefined;
}
exports.getEditForCodeAction = getEditForCodeAction;
async function applyCodeAction(client, action) {
    const workspaceEdit = getEditForCodeAction(client, action);
    if (workspaceEdit) {
        if (!(await vscode_1.workspace.applyEdit(workspaceEdit))) {
            return false;
        }
    }
    return applyCodeActionCommands(client, action);
}
exports.applyCodeAction = applyCodeAction;
async function applyCodeActionCommands(client, action) {
    if (action.commands && action.commands.length) {
        for (const command of action.commands) {
            const response = await client.execute('applyCodeActionCommand', { command });
            if (!response || !response.body) {
                return false;
            }
        }
    }
    return true;
}
exports.applyCodeActionCommands = applyCodeActionCommands;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/utils\codeAction.js.map
