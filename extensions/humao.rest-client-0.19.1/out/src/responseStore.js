"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class ResponseStore {
    static get size() {
        return ResponseStore.cache.size;
    }
    static add(uri, response) {
        ResponseStore.cache.set(uri, response);
        ResponseStore.lastResponseUri = uri;
    }
    static get(uri) {
        return ResponseStore.cache.get(uri);
    }
    static remove(uri) {
        ResponseStore.cache.delete(uri);
    }
    static getLatestResponse() {
        return ResponseStore.get(ResponseStore.lastResponseUri);
    }
}
ResponseStore.cache = new Map();
ResponseStore.lastResponseUri = null;
exports.ResponseStore = ResponseStore;
//# sourceMappingURL=responseStore.js.map