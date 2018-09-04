"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mimeUtility_1 = require("./mimeUtility");
const vscode_1 = require("vscode");
const validPath = new RegExp(/(\w+)(\.\w+|\[\d+\])*/);
const arrayPart = new RegExp(/(\w+)(\[\d+\])*/);
class ResponseProcessor {
    static getValueAtPath(response, path) {
        if (!response
            || !path
            || !ResponseProcessor.isValidPath(path)) {
            return undefined;
        }
        const parts = path.split(".");
        // Expect first part to be response name
        if (parts.length === 1)
            return response;
        let value = response;
        for (let i = 1; i < parts.length; i++) {
            let part = parts[i];
            // Retrieval from response object
            let matches = part.match(arrayPart);
            const partName = matches[1];
            const isBodyPart = i === 1 && partName === "body";
            value =
                isBodyPart
                    ? ResponseProcessor.parseResponseBody(value[partName], response.getResponseHeaderValue("content-type"))
                    : value[partName];
            for (let j = 2; j < matches.length; j++) {
                if (matches[j]) {
                    value = value[matches[j].replace("[", "").replace("]", "")];
                }
            }
        }
        return value;
    }
    static isValidPath(path) {
        return validPath.test(path);
    }
    static parseResponseBody(body, contentType) {
        if (contentType) {
            let mime = mimeUtility_1.MimeUtility.parse(contentType);
            let type = mime.type;
            let suffix = mime.suffix;
            if (type === 'application/json' || suffix === '+json') {
                try {
                    return JSON.parse(body);
                }
                catch () {
                    vscode_1.window.showWarningMessage('The content type of response is application/json, while response body is not a valid json string');
                }
            }
            else {
                vscode_1.window.showWarningMessage('Only JSON response is supported.');
            }
        }
        return body;
    }
}
exports.ResponseProcessor = ResponseProcessor;
//# sourceMappingURL=responseProcessor.js.map