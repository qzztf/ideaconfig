"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
const path = require("path");
const vscode_1 = require("vscode");
const relativePathResolver_1 = require("./relativePathResolver");
class TypeScriptPluginPathsProvider {
    constructor(configuration) {
        this.configuration = configuration;
        this.relativePathResolver = new relativePathResolver_1.RelativeWorkspacePathResolver();
    }
    updateConfiguration(configuration) {
        this.configuration = configuration;
    }
    getPluginPaths() {
        const pluginPaths = [];
        for (const pluginPath of this.configuration.tsServerPluginPaths) {
            pluginPaths.push(...this.resolvePluginPath(pluginPath));
        }
        return pluginPaths;
    }
    resolvePluginPath(pluginPath) {
        if (path.isAbsolute(pluginPath)) {
            return [pluginPath];
        }
        const workspacePath = this.relativePathResolver.asAbsoluteWorkspacePath(pluginPath);
        if (workspacePath !== undefined) {
            return [workspacePath];
        }
        return (vscode_1.workspace.workspaceFolders || [])
            .map(workspaceFolder => path.join(workspaceFolder.uri.fsPath, pluginPath));
    }
}
exports.TypeScriptPluginPathsProvider = TypeScriptPluginPathsProvider;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/utils\pluginPathsProvider.js.map
