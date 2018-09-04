"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
class RefreshPreviewCommand {
    constructor(webviewManager) {
        this.webviewManager = webviewManager;
        this.id = 'markdown.preview.refresh';
    }
    execute() {
        this.webviewManager.refresh();
    }
}
exports.RefreshPreviewCommand = RefreshPreviewCommand;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\markdown-language-features\out/commands\refreshPreview.js.map
