"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
class InMemoryDocument {
    constructor(uri, _contents) {
        this.uri = uri;
        this._contents = _contents;
        this.isUntitled = false;
        this.languageId = '';
        this.version = 1;
        this.isDirty = false;
        this.isClosed = false;
        this.eol = vscode.EndOfLine.LF;
        this._lines = this._contents.split(/\n/g);
    }
    get fileName() {
        return this.uri.fsPath;
    }
    get lineCount() {
        return this._lines.length;
    }
    lineAt(line) {
        return {
            lineNumber: line,
            text: this._lines[line],
            range: new vscode.Range(0, 0, 0, 0),
            firstNonWhitespaceCharacterIndex: 0,
            rangeIncludingLineBreak: new vscode.Range(0, 0, 0, 0),
            isEmptyOrWhitespace: false
        };
    }
    offsetAt(_position) {
        throw new Error('Method not implemented.');
    }
    positionAt(_offset) {
        throw new Error('Method not implemented.');
    }
    getText(_range) {
        return this._contents;
    }
    getWordRangeAtPosition(_position, _regex) {
        throw new Error('Method not implemented.');
    }
    validateRange(_range) {
        throw new Error('Method not implemented.');
    }
    validatePosition(_position) {
        throw new Error('Method not implemented.');
    }
    save() {
        throw new Error('Method not implemented.');
    }
}
exports.InMemoryDocument = InMemoryDocument;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\markdown-language-features\out/test\inMemoryDocument.js.map
