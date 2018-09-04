"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const typeConverters = require("../utils/typeConverters");
function getSymbolKind(item) {
    switch (item.kind) {
        case 'method': return vscode_1.SymbolKind.Method;
        case 'enum': return vscode_1.SymbolKind.Enum;
        case 'function': return vscode_1.SymbolKind.Function;
        case 'class': return vscode_1.SymbolKind.Class;
        case 'interface': return vscode_1.SymbolKind.Interface;
        case 'var': return vscode_1.SymbolKind.Variable;
        default: return vscode_1.SymbolKind.Variable;
    }
}
class TypeScriptWorkspaceSymbolProvider {
    constructor(client, modeIds) {
        this.client = client;
        this.modeIds = modeIds;
    }
    async provideWorkspaceSymbols(search, token) {
        const uri = this.getUri();
        if (!uri) {
            return [];
        }
        const filepath = this.client.normalizePath(uri);
        if (!filepath) {
            return [];
        }
        const args = {
            file: filepath,
            searchValue: search
        };
        const response = await this.client.execute('navto', args, token);
        if (!response.body) {
            return [];
        }
        const result = [];
        for (const item of response.body) {
            if (!item.containerName && item.kind === 'alias') {
                continue;
            }
            const label = TypeScriptWorkspaceSymbolProvider.getLabel(item);
            result.push(new vscode_1.SymbolInformation(label, getSymbolKind(item), item.containerName || '', typeConverters.Location.fromTextSpan(this.client.asUrl(item.file), item)));
        }
        return result;
    }
    static getLabel(item) {
        let label = item.name;
        if (item.kind === 'method' || item.kind === 'function') {
            label += '()';
        }
        return label;
    }
    getUri() {
        // typescript wants to have a resource even when asking
        // general questions so we check the active editor. If this
        // doesn't match we take the first TS document.
        const editor = vscode_1.window.activeTextEditor;
        if (editor) {
            const document = editor.document;
            if (document && this.modeIds.indexOf(document.languageId) >= 0) {
                return document.uri;
            }
        }
        const documents = vscode_1.workspace.textDocuments;
        for (const document of documents) {
            if (this.modeIds.indexOf(document.languageId) >= 0) {
                return document.uri;
            }
        }
        return undefined;
    }
}
exports.default = TypeScriptWorkspaceSymbolProvider;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/features\workspaceSymbolProvider.js.map
