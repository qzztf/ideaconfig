"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const definitionProviderBase_1 = require("./definitionProviderBase");
class TypeScriptImplementationProvider extends definitionProviderBase_1.default {
    provideImplementation(document, position, token) {
        return this.getSymbolLocations('implementation', document, position, token);
    }
}
exports.default = TypeScriptImplementationProvider;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/features\implementationProvider.js.map
