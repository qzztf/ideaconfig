"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const requestVariableEvent_1 = require("./events/requestVariableEvent");
class RequestVariableCache {
    static get size() {
        return RequestVariableCache.cache.size;
    }
    static add(cacheKey, value) {
        RequestVariableCache.cache.set(cacheKey.getCacheKey(), value);
        requestVariableEvent_1.fireEvent({ cacheKey });
    }
    static has(cacheKey) {
        return RequestVariableCache.cache.has(cacheKey.getCacheKey());
    }
    static get(cacheKey) {
        return RequestVariableCache.cache.get(cacheKey.getCacheKey());
    }
    static remove(cacheKey) {
        if (RequestVariableCache.cache.has(cacheKey.getCacheKey())) {
            RequestVariableCache.cache.delete(cacheKey.getCacheKey());
        }
    }
}
RequestVariableCache.cache = new Map();
exports.RequestVariableCache = RequestVariableCache;
//# sourceMappingURL=requestVariableCache.js.map