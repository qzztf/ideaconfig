"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const typeConverters = require("../utils/typeConverters");
class TypeScriptDefinitionProviderBase {
    constructor(client) {
        this.client = client;
    }
    async getSymbolLocations(definitionType, document, position, token) {
        const filepath = this.client.normalizePath(document.uri);
        if (!filepath) {
            return undefined;
        }
        const args = typeConverters.Position.toFileLocationRequestArgs(filepath, position);
        try {
            const response = await this.client.execute(definitionType, args, token);
            const locations = (response && response.body) || [];
            return locations.map(location => typeConverters.Location.fromTextSpan(this.client.asUrl(location.file), location));
        }
        catch (_a) {
            return [];
        }
    }
}
exports.default = TypeScriptDefinitionProviderBase;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\typescript-language-features\out/features\definitionProviderBase.js.map
