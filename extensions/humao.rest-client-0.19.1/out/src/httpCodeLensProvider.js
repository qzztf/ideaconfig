'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const selector_1 = require("./selector");
class HttpCodeLensProvider {
    provideCodeLenses(document, token) {
        let blocks = [];
        let lines = document.getText().split(/\r?\n/g);
        let delimitedLines = selector_1.Selector.getDelimiterRows(lines);
        delimitedLines.push(lines.length);
        let requestRange = [];
        let start = 0;
        for (let index = 0; index < delimitedLines.length; index++) {
            let end = delimitedLines[index] - 1;
            if (start <= end) {
                requestRange.push([start, end]);
                start = delimitedLines[index] + 1;
            }
        }
        for (let index = 0; index < requestRange.length; index++) {
            let [blockStart, blockEnd] = requestRange[index];
            // get real start for current requestRange
            while (blockStart <= blockEnd) {
                if (selector_1.Selector.isEmptyLine(lines[blockStart]) ||
                    selector_1.Selector.isCommentLine(lines[blockStart]) ||
                    selector_1.Selector.isVariableDefinitionLine(lines[blockStart])) {
                    blockStart++;
                }
                else {
                    break;
                }
            }
            if (selector_1.Selector.isResponseStatusLine(lines[blockStart])) {
                continue;
            }
            if (blockStart <= blockEnd) {
                const range = new vscode_1.Range(blockStart, 0, blockEnd, 0);
                const cmd = {
                    arguments: [document, range],
                    title: 'Send Request',
                    command: 'rest-client.request'
                };
                blocks.push(new vscode_1.CodeLens(range, cmd));
            }
        }
        return Promise.resolve(blocks);
    }
}
exports.HttpCodeLensProvider = HttpCodeLensProvider;
//# sourceMappingURL=httpCodeLensProvider.js.map