'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const workspaceUtility_1 = require("./workspaceUtility");
const path = require("path");
const url = require("url");
const fs = require("fs-extra");
class RequestBodyDocumentLinkProvider {
    constructor() {
        this._linkPattern = /^(\<\s+)(\S+)(\s*)$/g;
    }
    provideDocumentLinks(document, _token) {
        const results = [];
        const base = path.dirname(document.uri.toString());
        const text = document.getText();
        let lines = text.split(/\r?\n/g);
        for (let index = 0; index < lines.length; index++) {
            let line = lines[index];
            let match;
            if (match = this._linkPattern.exec(line)) {
                let filePath = match[2];
                const offset = match[1].length;
                const linkStart = new vscode_1.Position(index, offset);
                const linkEnd = new vscode_1.Position(index, offset + filePath.length);
                results.push(new vscode_1.DocumentLink(new vscode_1.Range(linkStart, linkEnd), this.normalizeLink(document, filePath, base)));
            }
        }
        return results;
    }
    normalizeLink(document, link, base) {
        let resourcePath;
        if (path.isAbsolute(link)) {
            resourcePath = vscode_1.Uri.file(link);
        }
        else {
            let rootPath = workspaceUtility_1.getWorkspaceRootPath();
            if (rootPath) {
                rootPath = rootPath.replace(/\/?$/, '/');
                let resourcePathString = url.resolve(rootPath, link);
                if (!fs.existsSync(resourcePathString)) {
                    base = base.replace(/\/?$/, '/');
                    resourcePathString = url.resolve(base, link);
                }
                resourcePath = vscode_1.Uri.parse(resourcePathString);
            }
            else {
                base = base.replace(/\/?$/, '/');
                resourcePath = vscode_1.Uri.parse(url.resolve(base, link));
            }
        }
        return vscode_1.Uri.parse(`command:rest-client._openDocumentLink?${encodeURIComponent(JSON.stringify({ path: resourcePath }))}`);
    }
}
exports.RequestBodyDocumentLinkProvider = RequestBodyDocumentLinkProvider;
//# sourceMappingURL=documentLinkProvider.js.map