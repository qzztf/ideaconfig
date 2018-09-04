"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function glob(pattern, opts) {
    const Glob = require('glob');
    return new Promise((resolve, reject) => {
        try {
            Glob(pattern, opts, (err, matches) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(matches);
                }
            });
        }
        catch (e) {
            reject(e);
        }
    });
}
exports.glob = glob;
function readFile(filename) {
    const FS = require('fs');
    return new Promise((resolve, reject) => {
        try {
            FS.readFile(filename, (err, data) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(data);
                }
            });
        }
        catch (e) {
            reject(e);
        }
    });
}
exports.readFile = readFile;
//# sourceMappingURL=fsUtility.js.map