"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function getHeader(headers, name) {
    if (!headers) {
        return null;
    }
    const headerName = Object.keys(headers).find(h => h.toLowerCase() === name.toLowerCase());
    return headerName && headers[headerName];
}
exports.getHeader = getHeader;
function hasHeader(headers, name) {
    return !!(headers && Object.keys(headers).some(h => h.toLowerCase() === name.toLowerCase()));
}
exports.hasHeader = hasHeader;
//# sourceMappingURL=misc.js.map