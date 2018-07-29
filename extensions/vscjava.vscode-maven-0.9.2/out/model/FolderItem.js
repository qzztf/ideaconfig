"use strict";
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const Utils_1 = require("../Utils");
class FolderItem extends vscode_1.TreeItem {
    constructor(name, contextValue, parentAbsolutePath, workpacePath, params) {
        super(name, vscode_1.TreeItemCollapsibleState.Collapsed);
        this.name = name;
        this.workspacePath = workpacePath;
        this.parentAbsolutePath = parentAbsolutePath;
        this.contextValue = contextValue;
        this.params = params || {};
        this.iconPath = { light: Utils_1.Utils.getPathToExtensionRoot("resources", "light", "folder.svg"), dark: Utils_1.Utils.getPathToExtensionRoot("resources", "dark", "folder.svg") };
    }
}
exports.FolderItem = FolderItem;
(function (FolderItem) {
    let ContextValue;
    (function (ContextValue) {
        ContextValue["Modules"] = "ModulesFolderItem";
    })(ContextValue = FolderItem.ContextValue || (FolderItem.ContextValue = {}));
})(FolderItem = exports.FolderItem || (exports.FolderItem = {}));
//# sourceMappingURL=FolderItem.js.map