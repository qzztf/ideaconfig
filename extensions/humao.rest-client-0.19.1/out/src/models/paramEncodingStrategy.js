'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
var ParamEncodingStrategy;
(function (ParamEncodingStrategy) {
    ParamEncodingStrategy[ParamEncodingStrategy["Automatic"] = 0] = "Automatic";
    ParamEncodingStrategy[ParamEncodingStrategy["Never"] = 1] = "Never";
    ParamEncodingStrategy[ParamEncodingStrategy["Always"] = 2] = "Always";
})(ParamEncodingStrategy = exports.ParamEncodingStrategy || (exports.ParamEncodingStrategy = {}));
function fromString(value) {
    value = value.toLowerCase();
    switch (value) {
        case 'never':
            return ParamEncodingStrategy.Never;
        case 'always':
            return ParamEncodingStrategy.Always;
        default:
            return ParamEncodingStrategy.Automatic;
    }
}
exports.fromString = fromString;
//# sourceMappingURL=paramEncodingStrategy.js.map