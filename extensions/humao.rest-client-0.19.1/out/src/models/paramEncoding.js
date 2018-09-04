'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
var ParamEncoding;
(function (ParamEncoding) {
    ParamEncoding[ParamEncoding["Automatic"] = 0] = "Automatic";
    ParamEncoding[ParamEncoding["Never"] = 1] = "Never";
    ParamEncoding[ParamEncoding["Always"] = 2] = "Always";
})(ParamEncoding = exports.ParamEncoding || (exports.ParamEncoding = {}));
function fromString(value) {
    value = value.toLowerCase();
    switch (value) {
        case 'never':
            return ParamEncoding.Never;
        case 'always':
            return ParamEncoding.Always;
        default:
            return ParamEncoding.Automatic;
    }
}
exports.fromString = fromString;
//# sourceMappingURL=paramEncoding.js.map