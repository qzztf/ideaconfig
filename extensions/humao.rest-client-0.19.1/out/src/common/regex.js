'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
function escapeRegExp(str) {
    return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
}
exports.escapeRegExp = escapeRegExp;
//# sourceMappingURL=regex.js.map