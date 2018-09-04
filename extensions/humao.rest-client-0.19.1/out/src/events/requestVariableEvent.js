"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const eventEmitter = new vscode_1.EventEmitter();
exports.fireEvent = (event) => eventEmitter.fire(event);
exports.OnRequestVariableEvent = eventEmitter.event;
//# sourceMappingURL=requestVariableEvent.js.map