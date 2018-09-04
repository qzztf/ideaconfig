"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class ResponseCache {
    static get size() {
        return ResponseCache.cache.size;
    }
    static add(cacheKey, response) {
        ResponseCache.cache.set(cacheKey.getCacheKey(), response);
    }
    static get(cacheKey) {
        return ResponseCache.cache.get(cacheKey.getCacheKey());
    }
    static remove(cacheKey) {
        if (ResponseCache.cache.has(cacheKey.getCacheKey())) {
            ResponseCache.cache.delete(cacheKey.getCacheKey());
        }
    }
}
ResponseCache.cache = new Map();
exports.ResponseCache = ResponseCache;
//# sourceMappingURL=responseCache.js.map