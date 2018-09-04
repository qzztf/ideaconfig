'use strict';
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const responseProcessor_1 = require("./responseProcessor");
const vscode_1 = require("vscode");
const variableProcessor_1 = require("./variableProcessor");
const variableUtility_1 = require("./variableUtility");
class ResponseVariableHoverProvider {
    provideHover(document, position, token) {
        return __awaiter(this, void 0, void 0, function* () {
            if (!variableUtility_1.VariableUtility.isResponseVariableReference(document, position)) {
                return;
            }
            // Lookup word + optional array path
            const wordRange = document.getWordRangeAtPosition(position, /\w+(\[\d+\])*/);
            let lineRange = document.lineAt(position);
            const fullPath = variableUtility_1.VariableUtility.getResponseVariablePath(wordRange, lineRange, position);
            const fileResponseVariables = variableProcessor_1.VariableProcessor.getResponseVariablesInFile(document);
            for (let [variableName, response] of fileResponseVariables) {
                let regex = new RegExp(`(${variableName})($|\.|\[\d+\])`);
                if (regex.test(fullPath)) {
                    const value = yield responseProcessor_1.ResponseProcessor.getValueAtPath(response, fullPath);
                    let contents = [JSON.stringify(value), { language: 'http', value: `Response Variable ${variableName}` }];
                    return new vscode_1.Hover(contents, wordRange);
                }
            }
            let contents = [{ language: 'http', value: `Warning: Response Variable ${fullPath} is not loaded in memory` }];
            return new vscode_1.Hover(contents, wordRange);
        });
    }
}
exports.ResponseVariableHoverProvider = ResponseVariableHoverProvider;
//# sourceMappingURL=responseVariableHoverProvider.js.map