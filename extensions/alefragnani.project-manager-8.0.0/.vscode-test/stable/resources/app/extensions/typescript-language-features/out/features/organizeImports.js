"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const nls = require("vscode-nls");
const languageModeIds_1 = require("../utils/languageModeIds");
const typeconverts = require("../utils/typeConverters");
const localize = nls.loadMessageBundle(__filename);
class OrganizeImportsCommand {
    constructor(client) {
        this.client = client;
        this.id = OrganizeImportsCommand.Id;
    }
    async execute() {
        if (!this.client.apiVersion.has280Features()) {
            return false;
        }
        const editor = vscode.window.activeTextEditor;
        if (!editor || !languageModeIds_1.isSupportedLanguageMode(editor.document)) {
            return false;
        }
        const file = this.client.normalizePath(editor.document.uri);
        if (!file) {
            return false;
        }
        const args = {
            scope: {
                type: 'file',
                args: {
                    file
                }
            }
        };
        const response = await this.client.execute('organizeImports', args);
        if (!response || !response.success) {
            return false;
        }
        const edits = typeconverts.WorkspaceEdit.fromFromFileCodeEdits(this.client, response.body);
        return await vscode.workspace.applyEdit(edits);
    }
}
OrganizeImportsCommand.Id = '_typescript.organizeImports';
class OrganizeImportsCodeActionProvider {
    constructor(client, commandManager) {
        this.client = client;
        this.metadata = {
            providedCodeActionKinds: [vscode.CodeActionKind.SourceOrganizeImports]
        };
        commandManager.register(new OrganizeImportsCommand(client));
    }
    provideCodeActions(_document, _range, _context, _token) {
        if (!this.client.apiVersion.has280Features()) {
            return [];
        }
        const action = new vscode.CodeAction(localize(0, null), vscode.CodeActionKind.SourceOrganizeImports);
        action.command = { title: '', command: OrganizeImportsCommand.Id };
        return [action];
    }
}
exports.OrganizeImportsCodeActionProvider = OrganizeImportsCodeActionProvider;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/features\organizeImports.js.map
