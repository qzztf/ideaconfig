"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class RequestStore {
    static add(requestId, request) {
        if (request && requestId) {
            RequestStore.cache.set(requestId, request);
            RequestStore.currentRequestId = requestId;
        }
    }
    static getLatest() {
        return RequestStore.cache.get(RequestStore.currentRequestId) || null;
    }
    static cancel(requestId = RequestStore.currentRequestId) {
        RequestStore.cancelledRequestIds.add(requestId);
    }
    static isCancelled(requestId) {
        return RequestStore.cancelledRequestIds.has(requestId);
    }
    static complete(requestId) {
        return requestId && RequestStore.completedRequestIds.add(requestId);
    }
    static isCompleted(requestId = RequestStore.currentRequestId) {
        return RequestStore.completedRequestIds.has(requestId);
    }
}
RequestStore.cache = new Map();
RequestStore.cancelledRequestIds = new Set();
RequestStore.completedRequestIds = new Set();
exports.RequestStore = RequestStore;
//# sourceMappingURL=requestStore.js.map