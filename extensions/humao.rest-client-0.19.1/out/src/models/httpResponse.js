"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const misc_1 = require("../utils/misc");
class HttpResponse {
    constructor(statusCode, statusMessage, httpVersion, headers, body, elapsedMillionSeconds, requestUrl, bodySizeInBytes, headersSizeInBytes, bodyStream, timingPhases, request) {
        this.statusCode = statusCode;
        this.statusMessage = statusMessage;
        this.httpVersion = httpVersion;
        this.headers = headers;
        this.body = body;
        this.elapsedMillionSeconds = elapsedMillionSeconds;
        this.requestUrl = requestUrl;
        this.bodySizeInBytes = bodySizeInBytes;
        this.headersSizeInBytes = headersSizeInBytes;
        this.bodyStream = bodyStream;
        this.timingPhases = timingPhases;
        this.request = request;
    }
    getHeader(name) {
        return misc_1.getHeader(this.headers, name);
    }
}
exports.HttpResponse = HttpResponse;
//# sourceMappingURL=httpResponse.js.map