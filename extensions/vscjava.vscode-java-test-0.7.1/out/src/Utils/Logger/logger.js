"use strict";
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_extension_telemetry_wrapper_1 = require("vscode-extension-telemetry-wrapper");
const winston = require("winston");
const Configs = require("../../Constants/configs");
function configure(context, transports) {
    winston.configure({
        transports: [
            ...transports,
            new (winston.transports.File)({ level: 'info', filename: context.asAbsolutePath(Configs.LOG_FILE_NAME) }),
        ],
    });
}
exports.configure = configure;
function info(message, metadata) {
    winston.info(message, withSessionId(metadata));
}
exports.info = info;
function warn(message, metadata) {
    winston.warn(message, withSessionId(metadata));
}
exports.warn = warn;
function error(message, metadata) {
    winston.error(message, withSessionId(metadata));
}
exports.error = error;
function currentSessionId() {
    const session = vscode_extension_telemetry_wrapper_1.TelemetryWrapper.currentSession();
    return session ? session.id : undefined;
}
exports.currentSessionId = currentSessionId;
function currentCommand() {
    const session = vscode_extension_telemetry_wrapper_1.TelemetryWrapper.currentSession();
    return session ? session.action : undefined;
}
exports.currentCommand = currentCommand;
function withSessionId(metadata) {
    return {
        sessionId: currentSessionId(),
        metadata,
    };
}
//# sourceMappingURL=logger.js.map