"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
/**
 * Helpers for converting FROM vscode types TO ts types
 */
const vscode = require("vscode");
var Range;
(function (Range) {
    Range.fromTextSpan = (span) => new vscode.Range(span.start.line - 1, span.start.offset - 1, span.end.line - 1, span.end.offset - 1);
    Range.toFileRangeRequestArgs = (file, range) => ({
        file,
        startLine: range.start.line + 1,
        startOffset: range.start.character + 1,
        endLine: range.end.line + 1,
        endOffset: range.end.character + 1
    });
})(Range = exports.Range || (exports.Range = {}));
var Position;
(function (Position) {
    Position.fromLocation = (tslocation) => new vscode.Position(tslocation.line - 1, tslocation.offset - 1);
    Position.toFileLocationRequestArgs = (file, position) => ({
        file,
        line: position.line + 1,
        offset: position.character + 1
    });
})(Position = exports.Position || (exports.Position = {}));
var Location;
(function (Location) {
    Location.fromTextSpan = (resource, tsTextSpan) => new vscode.Location(resource, Range.fromTextSpan(tsTextSpan));
})(Location = exports.Location || (exports.Location = {}));
var TextEdit;
(function (TextEdit) {
    TextEdit.fromCodeEdit = (edit) => new vscode.TextEdit(Range.fromTextSpan(edit), edit.newText);
})(TextEdit = exports.TextEdit || (exports.TextEdit = {}));
var WorkspaceEdit;
(function (WorkspaceEdit) {
    function fromFromFileCodeEdits(client, edits) {
        const workspaceEdit = new vscode.WorkspaceEdit();
        for (const edit of edits) {
            for (const textChange of edit.textChanges) {
                workspaceEdit.replace(client.asUrl(edit.fileName), Range.fromTextSpan(textChange), textChange.newText);
            }
        }
        return workspaceEdit;
    }
    WorkspaceEdit.fromFromFileCodeEdits = fromFromFileCodeEdits;
})(WorkspaceEdit = exports.WorkspaceEdit || (exports.WorkspaceEdit = {}));
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/utils\typeConverters.js.map
