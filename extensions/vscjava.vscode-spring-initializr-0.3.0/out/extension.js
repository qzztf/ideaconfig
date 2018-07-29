// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_extension_telemetry_wrapper_1 = require("vscode-extension-telemetry-wrapper");
const Routines_1 = require("./Routines");
const Utils_1 = require("./Utils");
function activate(context) {
    return __awaiter(this, void 0, void 0, function* () {
        yield Utils_1.Utils.loadPackageInfo(context);
        yield vscode_extension_telemetry_wrapper_1.TelemetryWrapper.initilizeFromJsonFile(context.asAbsolutePath("package.json"));
        ["maven-project", "gradle-project"].forEach((projectType) => {
            context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand(`spring.initializr.${projectType}`, () => __awaiter(this, void 0, void 0, function* () { return yield Routines_1.Routines.GenerateProject.run(projectType); })));
        });
        context.subscriptions.push(vscode_extension_telemetry_wrapper_1.TelemetryWrapper.registerCommand("spring.initializr.editStarters", (entry) => __awaiter(this, void 0, void 0, function* () { return yield Routines_1.Routines.EditStarters.run(entry); })));
    });
}
exports.activate = activate;
function deactivate() {
    // this method is called when your extension is deactivated
}
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map