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
const variableProcessor_1 = require("./variableProcessor");
const variableUtility_1 = require("./variableUtility");
const vscode_1 = require("vscode");
class ResponseVariableCompletionItemProvider {
    provideCompletionItems(document, position, token) {
        return __awaiter(this, void 0, void 0, function* () {
            if (!variableUtility_1.VariableUtility.isPartialResponseVariableReference(document, position)) {
                return [];
            }
            const wordRange = document.getWordRangeAtPosition(position);
            let lineRange = document.lineAt(position);
            const fullPath = variableUtility_1.VariableUtility.getResponseVariablePath(wordRange, lineRange, position);
            let completionItems = [];
            const fileResponseVariables = variableProcessor_1.VariableProcessor.getResponseVariablesInFile(document);
            for (let [variableName, response] of fileResponseVariables) {
                let regex = new RegExp(`(${variableName})($|\.|\[\d+\])`);
                if (regex.test(fullPath)) {
                    const valueAtPath = responseProcessor_1.ResponseProcessor.getValueAtPath(response, fullPath);
                    if (valueAtPath) {
                        let props = Object.getOwnPropertyNames(valueAtPath);
                        completionItems = props.map(p => {
                            let item = new vscode_1.CompletionItem(p);
                            item.detail = `(property) ${p}`;
                            item.documentation = p;
                            item.insertText = p;
                            item.kind = vscode_1.CompletionItemKind.Field;
                            return item;
                        });
                    }
                }
            }
            return completionItems;
        });
    }
}
exports.ResponseVariableCompletionItemProvider = ResponseVariableCompletionItemProvider;
//# sourceMappingURL=responseVariableCompletionItemProvider.js.map