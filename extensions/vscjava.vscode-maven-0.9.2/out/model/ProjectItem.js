"use strict";
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const Utils_1 = require("../Utils");
class ProjectItem extends vscode_1.TreeItem {
    constructor(artifactId, workpacePath, absolutePath, params) {
        super(`${artifactId}`, vscode_1.TreeItemCollapsibleState.Collapsed);
        this.artifactId = artifactId;
        this.abosolutePath = absolutePath;
        this.params = params || {};
        this.contextValue = "ProjectItem";
        this.workspacePath = workpacePath;
        this.iconPath = Utils_1.Utils.getPathToExtensionRoot("resources", "project.svg");
    }
}
exports.ProjectItem = ProjectItem;
//# sourceMappingURL=ProjectItem.js.map