"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const typeConverters = require("../utils/typeConverters");
class TypeScriptFormattingProvider {
    constructor(client, formattingOptionsManager) {
        this.client = client;
        this.formattingOptionsManager = formattingOptionsManager;
        this.enabled = true;
    }
    updateConfiguration(config) {
        this.enabled = config.get('format.enable', true);
    }
    isEnabled() {
        return this.enabled;
    }
    async doFormat(document, options, args, token) {
        await this.formattingOptionsManager.ensureFormatOptions(document, options, token);
        try {
            const response = await this.client.execute('format', args, token);
            if (response.body) {
                return response.body.map(typeConverters.TextEdit.fromCodeEdit);
            }
        }
        catch (_a) {
            // noop
        }
        return [];
    }
    async provideDocumentRangeFormattingEdits(document, range, options, token) {
        const absPath = this.client.normalizePath(document.uri);
        if (!absPath) {
            return [];
        }
        const args = {
            file: absPath,
            line: range.start.line + 1,
            offset: range.start.character + 1,
            endLine: range.end.line + 1,
            endOffset: range.end.character + 1
        };
        return this.doFormat(document, options, args, token);
    }
    async provideOnTypeFormattingEdits(document, position, ch, options, token) {
        const filepath = this.client.normalizePath(document.uri);
        if (!filepath) {
            return [];
        }
        await this.formattingOptionsManager.ensureFormatOptions(document, options, token);
        const args = {
            file: filepath,
            line: position.line + 1,
            offset: position.character + 1,
            key: ch
        };
        try {
            const response = await this.client.execute('formatonkey', args, token);
            const edits = response.body;
            const result = [];
            if (!edits) {
                return result;
            }
            for (const edit of edits) {
                const textEdit = typeConverters.TextEdit.fromCodeEdit(edit);
                const range = textEdit.range;
                // Work around for https://github.com/Microsoft/TypeScript/issues/6700.
                // Check if we have an edit at the beginning of the line which only removes white spaces and leaves
                // an empty line. Drop those edits
                if (range.start.character === 0 && range.start.line === range.end.line && textEdit.newText === '') {
                    const lText = document.lineAt(range.start.line).text;
                    // If the edit leaves something on the line keep the edit (note that the end character is exclusive).
                    // Keep it also if it removes something else than whitespace
                    if (lText.trim().length > 0 || lText.length > range.end.character) {
                        result.push(textEdit);
                    }
                }
                else {
                    result.push(textEdit);
                }
            }
            return result;
        }
        catch (_a) {
            // noop
        }
        return [];
    }
}
exports.TypeScriptFormattingProvider = TypeScriptFormattingProvider;
class FormattingProviderManager {
    constructor(modeId, formattingProvider, selector) {
        this.modeId = modeId;
        this.formattingProvider = formattingProvider;
        this.selector = selector;
    }
    dispose() {
        if (this.formattingProviderRegistration) {
            this.formattingProviderRegistration.dispose();
            this.formattingProviderRegistration = undefined;
        }
    }
    updateConfiguration() {
        const config = vscode_1.workspace.getConfiguration(this.modeId);
        this.formattingProvider.updateConfiguration(config);
        if (!this.formattingProvider.isEnabled() && this.formattingProviderRegistration) {
            this.formattingProviderRegistration.dispose();
            this.formattingProviderRegistration = undefined;
        }
        else if (this.formattingProvider.isEnabled() && !this.formattingProviderRegistration) {
            this.formattingProviderRegistration = vscode_1.languages.registerDocumentRangeFormattingEditProvider(this.selector, this.formattingProvider);
        }
    }
}
exports.FormattingProviderManager = FormattingProviderManager;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/features\formattingProvider.js.map
