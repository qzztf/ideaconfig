"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const dispose_1 = require("../util/dispose");
const file_1 = require("../util/file");
const lazy_1 = require("../util/lazy");
class VSCodeWorkspaceMarkdownDocumentProvider {
    constructor() {
        this._onDidChangeMarkdownDocumentEmitter = new vscode.EventEmitter();
        this._onDidCreateMarkdownDocumentEmitter = new vscode.EventEmitter();
        this._onDidDeleteMarkdownDocumentEmitter = new vscode.EventEmitter();
        this._disposables = [];
    }
    dispose() {
        this._onDidChangeMarkdownDocumentEmitter.dispose();
        this._onDidDeleteMarkdownDocumentEmitter.dispose();
        if (this._watcher) {
            this._watcher.dispose();
        }
        dispose_1.disposeAll(this._disposables);
    }
    async getAllMarkdownDocuments() {
        const resources = await vscode.workspace.findFiles('**/*.md', '**/node_modules/**');
        const documents = await Promise.all(resources.map(resource => vscode.workspace.openTextDocument(resource).then(x => x, () => undefined)));
        return documents.filter(doc => doc && file_1.isMarkdownFile(doc));
    }
    get onDidChangeMarkdownDocument() {
        this.ensureWatcher();
        return this._onDidChangeMarkdownDocumentEmitter.event;
    }
    get onDidCreateMarkdownDocument() {
        this.ensureWatcher();
        return this._onDidCreateMarkdownDocumentEmitter.event;
    }
    get onDidDeleteMarkdownDocument() {
        this.ensureWatcher();
        return this._onDidDeleteMarkdownDocumentEmitter.event;
    }
    ensureWatcher() {
        if (this._watcher) {
            return;
        }
        this._watcher = vscode.workspace.createFileSystemWatcher('**/*.md');
        this._watcher.onDidChange(async (resource) => {
            const document = await vscode.workspace.openTextDocument(resource);
            if (file_1.isMarkdownFile(document)) {
                this._onDidChangeMarkdownDocumentEmitter.fire(document);
            }
        }, null, this._disposables);
        this._watcher.onDidCreate(async (resource) => {
            const document = await vscode.workspace.openTextDocument(resource);
            if (file_1.isMarkdownFile(document)) {
                this._onDidCreateMarkdownDocumentEmitter.fire(document);
            }
        }, null, this._disposables);
        this._watcher.onDidDelete(async (resource) => {
            this._onDidDeleteMarkdownDocumentEmitter.fire(resource);
        }, null, this._disposables);
        vscode.workspace.onDidChangeTextDocument(e => {
            if (file_1.isMarkdownFile(e.document)) {
                this._onDidChangeMarkdownDocumentEmitter.fire(e.document);
            }
        }, null, this._disposables);
    }
}
class MarkdownWorkspaceSymbolProvider {
    constructor(_symbolProvider, _workspaceMarkdownDocumentProvider = new VSCodeWorkspaceMarkdownDocumentProvider()) {
        this._symbolProvider = _symbolProvider;
        this._workspaceMarkdownDocumentProvider = _workspaceMarkdownDocumentProvider;
        this._symbolCache = new Map();
        this._symbolCachePopulated = false;
        this._disposables = [];
    }
    async provideWorkspaceSymbols(query) {
        if (!this._symbolCachePopulated) {
            await this.populateSymbolCache();
            this._symbolCachePopulated = true;
            this._workspaceMarkdownDocumentProvider.onDidChangeMarkdownDocument(this.onDidChangeDocument, this, this._disposables);
            this._workspaceMarkdownDocumentProvider.onDidCreateMarkdownDocument(this.onDidChangeDocument, this, this._disposables);
            this._workspaceMarkdownDocumentProvider.onDidDeleteMarkdownDocument(this.onDidDeleteDocument, this, this._disposables);
        }
        const allSymbolsSets = await Promise.all(Array.from(this._symbolCache.values()).map(x => x.value));
        const allSymbols = Array.prototype.concat.apply([], allSymbolsSets);
        return allSymbols.filter(symbolInformation => symbolInformation.name.toLowerCase().indexOf(query.toLowerCase()) !== -1);
    }
    async populateSymbolCache() {
        const markDownDocumentUris = await this._workspaceMarkdownDocumentProvider.getAllMarkdownDocuments();
        for (const document of markDownDocumentUris) {
            this._symbolCache.set(document.fileName, this.getSymbols(document));
        }
    }
    dispose() {
        dispose_1.disposeAll(this._disposables);
    }
    getSymbols(document) {
        return lazy_1.lazy(async () => {
            return this._symbolProvider.provideDocumentSymbols(document);
        });
    }
    onDidChangeDocument(document) {
        this._symbolCache.set(document.fileName, this.getSymbols(document));
    }
    onDidDeleteDocument(resource) {
        this._symbolCache.delete(resource.fsPath);
    }
}
exports.default = MarkdownWorkspaceSymbolProvider;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\markdown-language-features\out/features\workspaceSymbolProvider.js.map
