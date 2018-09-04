'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const selector_1 = require("./selector");
const jsonc_parser_1 = require("jsonc-parser");
class RequestBodyOnTypeFormatter {
    provideOnTypeFormattingEdits(document, position, ch, options, token) {
        console.log(position);
        if (!selector_1.Selector.isInJSONRequestBodyRange(document, position)) {
            return;
        }
        const edits = jsonc_parser_1.format(document.getText(), { range: document.offsetAt(new vscode_1.Position(position.line)), offset: document.lineAt(position.line).text.length });
        throw new Error("Method not implemented.");
    }
}
exports.RequestBodyOnTypeFormatter = RequestBodyOnTypeFormatter;
//# sourceMappingURL=requestBodyOnTypeFormatter.js.map