"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class HttpResponseCacheKey {
    constructor(key, documentUri) {
        this.key = key;
        this.documentUri = documentUri;
    }
    getCacheKey() {
        return `${this.key}@${this.documentUri}`;
    }
}
exports.HttpResponseCacheKey = HttpResponseCacheKey;
//# sourceMappingURL=httpResponseCacheKey.js.map