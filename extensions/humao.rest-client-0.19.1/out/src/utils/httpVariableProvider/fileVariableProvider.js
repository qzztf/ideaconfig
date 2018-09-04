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
const Constants = require("../../common/constants");
const variableType_1 = require("../../models/variableType");
const misc_1 = require("../misc");
class FileVariableProvider {
    constructor() {
        this.escapee = new Map([
            ['n', '\n'],
            ['r', '\r'],
            ['t', '\t']
        ]);
        this.cache = new Map();
        this.fileMD5Hash = new Map();
        this.type = variableType_1.VariableType.File;
    }
    static get Instance() {
        if (!FileVariableProvider._instance) {
            FileVariableProvider._instance = new FileVariableProvider();
        }
        return FileVariableProvider._instance;
    }
    has(document, name) {
        return __awaiter(this, void 0, void 0, function* () {
            const variables = yield this.getFileVariables(document);
            return variables.some(v => v.name === name);
        });
    }
    get(document, name) {
        return __awaiter(this, void 0, void 0, function* () {
            const variables = yield this.getFileVariables(document);
            const variable = variables.find(v => v.name === name);
            if (!variable) {
                return { name, error: "File variable does not exist" /* FileVariableNotExist */ };
            }
            else {
                return variable;
            }
        });
    }
    getAll(document) {
        return this.getFileVariables(document);
    }
    getFileVariables(document) {
        return __awaiter(this, void 0, void 0, function* () {
            const file = document.uri.toString();
            const fileContent = document.getText();
            const fileHash = misc_1.calculateMD5Hash(fileContent);
            if (!this.cache.has(file) || fileHash !== this.fileMD5Hash.get(file)) {
                const variables = [];
                const regex = new RegExp(Constants.FileVariableDefinitionRegex, 'mg');
                let match;
                while (match = regex.exec(fileContent)) {
                    let key = match[1];
                    let originalValue = match[2];
                    let value = "";
                    let isPrevCharEscape = false;
                    for (const currentChar of originalValue) {
                        if (isPrevCharEscape) {
                            isPrevCharEscape = false;
                            value += this.escapee.get(currentChar) || currentChar;
                        }
                        else {
                            if (currentChar === "\\") {
                                isPrevCharEscape = true;
                                continue;
                            }
                            value += currentChar;
                        }
                    }
                    variables.push({ name: key, value });
                }
                this.cache.set(file, variables);
                this.fileMD5Hash.set(file, fileHash);
            }
            return this.cache.get(file);
        });
    }
}
exports.FileVariableProvider = FileVariableProvider;
//# sourceMappingURL=fileVariableProvider.js.map