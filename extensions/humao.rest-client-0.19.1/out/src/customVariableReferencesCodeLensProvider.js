'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const selector_1 = require("./selector");
const Constants = require("./constants");
const variableUtility_1 = require("./variableUtility");
class CustomVariableReferencesCodeLensProvider {
    provideCodeLenses(document, token) {
        let blocks = [];
        let lines = document.getText().split(/\r?\n/g);
        let delimitedLines = selector_1.Selector.getDelimiterRows(lines);
        delimitedLines.push(lines.length);
        let requestRange = [];
        let start = 0;
        for (const current of delimitedLines) {
            let end = current - 1;
            if (start <= end) {
                requestRange.push([start, end]);
                start = current + 1;
            }
        }
        for (let [blockStart, blockEnd] of requestRange) {
            while (blockStart <= blockEnd) {
                const line = lines[blockStart];
                if (selector_1.Selector.isVariableDefinitionLine(line)) {
                    const range = new vscode_1.Range(blockStart, 0, blockEnd, 0);
                    let match;
                    if (match = Constants.VariableDefinitionRegex.exec(line)) {
                        const variableName = match[1];
                        const locations = variableUtility_1.VariableUtility.getReferenceRanges(lines, variableName);
                        const cmd = {
                            arguments: [document.uri, range.start, locations.map(loc => new vscode_1.Location(document.uri, loc))],
                            title: locations.length === 1 ? '1 reference' : `${locations.length} references`,
                            command: locations.length ? 'editor.action.showReferences' : '',
                        };
                        blocks.push(new vscode_1.CodeLens(range, cmd));
                    }
                    blockStart++;
                }
                else if (!line.trim()) {
                    blockStart++;
                }
                else {
                    break;
                }
            }
        }
        return Promise.resolve(blocks);
    }
}
exports.CustomVariableReferencesCodeLensProvider = CustomVariableReferencesCodeLensProvider;
//# sourceMappingURL=customVariableReferencesCodeLensProvider.js.map