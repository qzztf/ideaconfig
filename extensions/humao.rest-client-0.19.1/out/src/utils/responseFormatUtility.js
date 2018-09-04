'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const main_1 = require("jsonc-parser/lib/umd/main");
const os_1 = require("os");
const vscode_1 = require("vscode");
const mimeUtility_1 = require("./mimeUtility");
const pd = require('pretty-data').pd;
class ResponseFormatUtility {
    static formatBody(body, contentType, suppressValidation) {
        if (contentType) {
            if (mimeUtility_1.MimeUtility.isJSON(contentType)) {
                if (ResponseFormatUtility.IsJsonString(body)) {
                    const edits = main_1.format(body, undefined, { tabSize: 2, insertSpaces: true, eol: os_1.EOL });
                    body = main_1.applyEdits(body, edits);
                }
                else if (!suppressValidation) {
                    vscode_1.window.showWarningMessage('The content type of response is application/json, while response body is not a valid json string');
                }
            }
            else if (mimeUtility_1.MimeUtility.isXml(contentType)) {
                body = pd.xml(body);
            }
            else if (mimeUtility_1.MimeUtility.isCSS(contentType)) {
                body = pd.css(body);
            }
        }
        return body;
    }
    static IsJsonString(data) {
        try {
            JSON.parse(data);
            return true;
        }
        catch (_a) {
            return false;
        }
    }
}
exports.ResponseFormatUtility = ResponseFormatUtility;
//# sourceMappingURL=responseFormatUtility.js.map