"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function toHttpString(val) {
    const _ = require('lodash');
    if (_.isNil(val)) {
        return val;
    }
    if (Buffer.isBuffer(val)) {
        return val.toString('ascii');
    }
    return '' + val;
}
exports.toHttpString = toHttpString;
//# sourceMappingURL=valueUtility.js.map