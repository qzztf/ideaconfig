"use strict";
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
class WorkspaceItem extends vscode_1.TreeItem {
    constructor(name, absolutePath, params) {
        super(name, vscode_1.TreeItemCollapsibleState.Expanded);
        this.name = name;
        this.abosolutePath = absolutePath;
        this.params = params || {};
        this.contextValue = "WorkspaceItem";
    }
}
exports.WorkspaceItem = WorkspaceItem;
//# sourceMappingURL=WorkspaceItem.js.map