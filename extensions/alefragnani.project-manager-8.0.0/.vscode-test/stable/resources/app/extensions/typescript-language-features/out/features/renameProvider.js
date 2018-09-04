"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const typeConverters = require("../utils/typeConverters");
class TypeScriptRenameProvider {
    constructor(client) {
        this.client = client;
    }
    async provideRenameEdits(document, position, newName, token) {
        const file = this.client.normalizePath(document.uri);
        if (!file) {
            return null;
        }
        const args = Object.assign({}, typeConverters.Position.toFileLocationRequestArgs(file, position), { findInStrings: false, findInComments: false });
        try {
            const response = await this.client.execute('rename', args, token);
            if (!response.body) {
                return null;
            }
            const renameInfo = response.body.info;
            if (!renameInfo.canRename) {
                return Promise.reject(renameInfo.localizedErrorMessage);
            }
            return this.toWorkspaceEdit(response.body.locs, newName);
        }
        catch (_a) {
            // noop
        }
        return null;
    }
    toWorkspaceEdit(locations, newName) {
        const result = new vscode_1.WorkspaceEdit();
        for (const spanGroup of locations) {
            const resource = this.client.asUrl(spanGroup.file);
            if (resource) {
                for (const textSpan of spanGroup.locs) {
                    result.replace(resource, typeConverters.Range.fromTextSpan(textSpan), newName);
                }
            }
        }
        return result;
    }
}
exports.default = TypeScriptRenameProvider;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/features\renameProvider.js.map
