"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
class DiagnosticSet {
    constructor() {
        this._map = Object.create(null);
    }
    set(file, diagnostics) {
        this._map[this.key(file)] = diagnostics;
    }
    get(file) {
        return this._map[this.key(file)] || [];
    }
    clear() {
        this._map = Object.create(null);
    }
    key(file) {
        return file.toString(true);
    }
}
var DiagnosticKind;
(function (DiagnosticKind) {
    DiagnosticKind[DiagnosticKind["Syntax"] = 0] = "Syntax";
    DiagnosticKind[DiagnosticKind["Semantic"] = 1] = "Semantic";
    DiagnosticKind[DiagnosticKind["Suggestion"] = 2] = "Suggestion";
})(DiagnosticKind = exports.DiagnosticKind || (exports.DiagnosticKind = {}));
const allDiagnosticKinds = [DiagnosticKind.Syntax, DiagnosticKind.Semantic, DiagnosticKind.Suggestion];
class DiagnosticsManager {
    constructor(language) {
        this._diagnostics = new Map();
        this._validate = true;
        this._enableSuggestions = true;
        for (const kind of allDiagnosticKinds) {
            this._diagnostics.set(kind, new DiagnosticSet());
        }
        this._currentDiagnostics = vscode.languages.createDiagnosticCollection(language);
    }
    dispose() {
        this._currentDiagnostics.dispose();
    }
    reInitialize() {
        this._currentDiagnostics.clear();
        for (const diagnosticSet of this._diagnostics.values()) {
            diagnosticSet.clear();
        }
    }
    set validate(value) {
        if (this._validate === value) {
            return;
        }
        this._validate = value;
        if (!value) {
            this._currentDiagnostics.clear();
        }
    }
    set enableSuggestions(value) {
        if (this._enableSuggestions === value) {
            return;
        }
        this._enableSuggestions = value;
        if (!value) {
            this._currentDiagnostics.clear();
        }
    }
    diagnosticsReceived(kind, file, syntaxDiagnostics) {
        const diagnostics = this._diagnostics.get(kind);
        if (diagnostics) {
            diagnostics.set(file, syntaxDiagnostics);
            this.updateCurrentDiagnostics(file);
        }
    }
    configFileDiagnosticsReceived(file, diagnostics) {
        this._currentDiagnostics.set(file, diagnostics);
    }
    delete(resource) {
        this._currentDiagnostics.delete(resource);
    }
    updateCurrentDiagnostics(file) {
        if (!this._validate) {
            return;
        }
        const allDiagnostics = [];
        allDiagnostics.push(...this._diagnostics.get(DiagnosticKind.Syntax).get(file));
        allDiagnostics.push(...this._diagnostics.get(DiagnosticKind.Semantic).get(file));
        if (this._enableSuggestions) {
            allDiagnostics.push(...this._diagnostics.get(DiagnosticKind.Suggestion).get(file));
        }
        this._currentDiagnostics.set(file, allDiagnostics);
    }
    getDiagnostics(file) {
        return this._currentDiagnostics.get(file) || [];
    }
}
exports.DiagnosticsManager = DiagnosticsManager;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/features\diagnostics.js.map
