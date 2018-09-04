'use strict';
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const m = require("moment");
// keep sure to have no conflicts with variables
// when executing script code
function runRequestScript(_57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979) {
    return __awaiter(this, void 0, void 0, function* () {
        // tslint:disable-next-line:no-unused-variable
        const $vscode = require('vscode');
        // tslint:disable-next-line:no-unused-variable
        const $workspaces = $vscode.workspace.workspaceFolders;
        // tslint:disable-next-line:no-unused-variable
        const _ = require('lodash');
        // tslint:disable-next-line:no-unused-variable
        const $cwd = _57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979.cwd;
        // tslint:disable-next-line:no-unused-variable
        const $each = function (list, action) {
            return __awaiter(this, void 0, void 0, function* () {
                let lastResult;
                if (list) {
                    let index = -1;
                    for (const ITEM of list) {
                        ++index;
                        if (action) {
                            lastResult = yield Promise.resolve(action(ITEM, index, lastResult));
                        }
                    }
                }
                return lastResult;
            });
        };
        // tslint:disable-next-line:no-unused-variable
        const $fs = require('fs-extra');
        // tslint:disable-next-line:no-unused-variable
        const $glob = require('glob');
        // tslint:disable-next-line:no-unused-variable
        const $linq = require('node-enumerable');
        // tslint:disable-next-line:no-unused-variable
        const $minimatch = require('minimatch');
        // tslint:disable-next-line:no-unused-variable
        const $moment = require('moment');
        // tslint:disable-next-line:no-unused-variable
        const $now = () => $moment();
        // tslint:disable-next-line:no-unused-variable
        const $path = require('path');
        // tslint:disable-next-line:no-unused-variable
        let $lastRequest;
        // tslint:disable-next-line:no-unused-variable
        let $lastResponse;
        // tslint:disable-next-line:no-unused-variable
        const $request = (vars, complete) => __awaiter(this, void 0, void 0, function* () {
            let httpRequest;
            let httpResponse;
            try {
                httpRequest = yield _57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979.buildRequest({
                    vars,
                });
                $lastRequest = httpRequest;
                httpResponse = yield _57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979.run({
                    request: httpRequest,
                });
                $lastResponse = httpResponse;
                if (complete) {
                    yield Promise.resolve(complete(null, httpResponse, httpRequest));
                }
            }
            catch (e) {
                if (complete) {
                    yield Promise.resolve(complete(e, null, httpRequest));
                }
                else {
                    throw e;
                }
            }
            return httpResponse;
        });
        // tslint:disable-next-line:no-unused-variable
        const $require = function (id) {
            return require(id);
        };
        // tslint:disable-next-line:no-unused-variable
        const $sleep = function (ms) {
            if (arguments.length < 1) {
                ms = 1000;
            }
            ms = parseInt(('' + ms).trim());
            return new Promise((resolve, reject) => {
                try {
                    setTimeout(() => {
                        resolve();
                    }, ms);
                }
                catch (e) {
                    reject(e);
                }
            });
        };
        // tslint:disable-next-line:no-unused-variable
        const $utc = () => $moment.utc();
        // tslint:disable-next-line:no-unused-variable
        const $uuid = _57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979.uuid;
        // tslint:disable-next-line:no-unused-variable
        const $fullPath = function (fullOrRelativePath, basePath) {
            if (arguments.length < 2) {
                basePath = $workspaces[0].uri.fsPath;
            }
            basePath = '' + basePath;
            if (!$path.isAbsolute(basePath)) {
                basePath = $path.join($workspaces[0].uri.fsPath, basePath);
            }
            basePath = $path.resolve(basePath);
            fullOrRelativePath = '' + fullOrRelativePath;
            if (!$path.isAbsolute(fullOrRelativePath)) {
                fullOrRelativePath = $path.join(basePath, fullOrRelativePath);
            }
            return $path.resolve(fullOrRelativePath);
        };
        yield $vscode.window.withProgress({
            location: $vscode.ProgressLocation.Window,
        }, (
        // keep sure to have no conflicts with variables
        // when executing script code
        _5979_tm_23979_mk_b1f2710f140b4581bc8ceeabf7f71d33) => __awaiter(this, void 0, void 0, function* () {
            // tslint:disable-next-line:no-unused-variable
            const $progress = (msg) => {
                _5979_tm_23979_mk_b1f2710f140b4581bc8ceeabf7f71d33.report({
                    message: msg,
                });
            };
            // tslint:disable-next-line:no-unused-variable
            const $start = $moment();
            // tslint:disable-next-line:no-unused-variable
            const $runsSince = function (unitOfTime, precise) {
                if (arguments.length > 1) {
                    precise = !!precise;
                }
                return m().diff($start, unitOfTime, precise);
            };
            $progress(_.isNil(_57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979.scriptFile) ?
                `Running REST script for '${$path.basename(_57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979.requestFile)}'...` :
                `Running REST script '${$path.basename(_57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979.scriptFile)}' for '${$path.basename(_57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979.requestFile)}'...`);
            return Promise.resolve(eval(_57b252af4b9749f6a793ac3342d748ae_mk_23979_tm_5979.script));
        }));
    });
}
exports.runRequestScript = runRequestScript;
//# sourceMappingURL=scriptUtility.js.map