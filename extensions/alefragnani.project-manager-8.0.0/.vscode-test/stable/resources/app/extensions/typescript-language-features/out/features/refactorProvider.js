/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
const typeConverters = require("../utils/typeConverters");
class ApplyRefactoringCommand {
    constructor(client, formattingOptionsManager) {
        this.client = client;
        this.formattingOptionsManager = formattingOptionsManager;
        this.id = ApplyRefactoringCommand.ID;
    }
    async execute(document, file, refactor, action, range) {
        await this.formattingOptionsManager.ensureFormatOptionsForDocument(document, undefined);
        const args = Object.assign({}, typeConverters.Range.toFileRangeRequestArgs(file, range), { refactor,
            action });
        const response = await this.client.execute('getEditsForRefactor', args);
        if (!response || !response.body || !response.body.edits.length) {
            return false;
        }
        const edit = typeConverters.WorkspaceEdit.fromFromFileCodeEdits(this.client, response.body.edits);
        if (!(await vscode.workspace.applyEdit(edit))) {
            return false;
        }
        const renameLocation = response.body.renameLocation;
        if (renameLocation) {
            if (vscode.window.activeTextEditor && vscode.window.activeTextEditor.document.uri.fsPath === document.uri.fsPath) {
                const pos = typeConverters.Position.fromLocation(renameLocation);
                vscode.window.activeTextEditor.selection = new vscode.Selection(pos, pos);
                await vscode.commands.executeCommand('editor.action.rename');
            }
        }
        return true;
    }
}
ApplyRefactoringCommand.ID = '_typescript.applyRefactoring';
class SelectRefactorCommand {
    constructor(doRefactoring) {
        this.doRefactoring = doRefactoring;
        this.id = SelectRefactorCommand.ID;
    }
    async execute(document, file, info, range) {
        const selected = await vscode.window.showQuickPick(info.actions.map((action) => ({
            label: action.name,
            description: action.description
        })));
        if (!selected) {
            return false;
        }
        return this.doRefactoring.execute(document, file, info.name, selected.label, range);
    }
}
SelectRefactorCommand.ID = '_typescript.selectRefactoring';
class TypeScriptRefactorProvider {
    constructor(client, formattingOptionsManager, commandManager) {
        this.client = client;
        this.metadata = {
            providedCodeActionKinds: [vscode.CodeActionKind.Refactor]
        };
        const doRefactoringCommand = commandManager.register(new ApplyRefactoringCommand(this.client, formattingOptionsManager));
        commandManager.register(new SelectRefactorCommand(doRefactoringCommand));
    }
    async provideCodeActions(document, _range, context, token) {
        if (!this.client.apiVersion.has240Features()) {
            return [];
        }
        if (context.only && !vscode.CodeActionKind.Refactor.contains(context.only)) {
            return [];
        }
        if (!vscode.window.activeTextEditor) {
            return [];
        }
        const editor = vscode.window.activeTextEditor;
        const file = this.client.normalizePath(document.uri);
        if (!file || editor.document.uri.fsPath !== document.uri.fsPath) {
            return [];
        }
        if (editor.selection.isEmpty) {
            return [];
        }
        const range = editor.selection;
        const args = typeConverters.Range.toFileRangeRequestArgs(file, range);
        try {
            const response = await this.client.execute('getApplicableRefactors', args, token);
            if (!response || !response.body) {
                return [];
            }
            const actions = [];
            for (const info of response.body) {
                if (info.inlineable === false) {
                    const codeAction = new vscode.CodeAction(info.description, vscode.CodeActionKind.Refactor);
                    codeAction.command = {
                        title: info.description,
                        command: SelectRefactorCommand.ID,
                        arguments: [document, file, info, range]
                    };
                    actions.push(codeAction);
                }
                else {
                    for (const action of info.actions) {
                        const codeAction = new vscode.CodeAction(action.description, TypeScriptRefactorProvider.getKind(action));
                        codeAction.command = {
                            title: action.description,
                            command: ApplyRefactoringCommand.ID,
                            arguments: [document, file, info.name, action.name, range]
                        };
                        actions.push(codeAction);
                    }
                }
            }
            return actions;
        }
        catch (_a) {
            return [];
        }
    }
    static getKind(refactor) {
        if (refactor.name.startsWith('function_')) {
            return TypeScriptRefactorProvider.extractFunctionKind;
        }
        else if (refactor.name.startsWith('constant_')) {
            return TypeScriptRefactorProvider.extractConstantKind;
        }
        return vscode.CodeActionKind.Refactor;
    }
}
TypeScriptRefactorProvider.extractFunctionKind = vscode.CodeActionKind.RefactorExtract.append('function');
TypeScriptRefactorProvider.extractConstantKind = vscode.CodeActionKind.RefactorExtract.append('constant');
exports.default = TypeScriptRefactorProvider;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/features\refactorProvider.js.map
