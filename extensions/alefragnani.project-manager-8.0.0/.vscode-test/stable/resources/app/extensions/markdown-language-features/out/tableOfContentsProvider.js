"use strict";
/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
Object.defineProperty(exports, "__esModule", { value: true });
const vscode = require("vscode");
class Slug {
    constructor(value) {
        this.value = value;
    }
    static fromHeading(heading) {
        const slugifiedHeading = encodeURI(heading.trim()
            .toLowerCase()
            .replace(/./g, c => Slug.specialChars[c] || c)
            .replace(/[\]\[\!\'\#\$\%\&\'\(\)\*\+\,\.\/\:\;\<\=\>\?\@\\\^\_\{\|\}\~\`]/g, '')
            .replace(/\s+/g, '-') // Replace whitespace with -
            .replace(/[^\w\-]+/g, '') // Remove remaining non-word chars
            .replace(/^\-+/, '') // Remove leading -
            .replace(/\-+$/, '') // Remove trailing -
        );
        return new Slug(slugifiedHeading);
    }
    equals(other) {
        return this.value === other.value;
    }
}
Slug.specialChars = { 'à': 'a', 'ä': 'a', 'ã': 'a', 'á': 'a', 'â': 'a', 'æ': 'a', 'å': 'a', 'ë': 'e', 'è': 'e', 'é': 'e', 'ê': 'e', 'î': 'i', 'ï': 'i', 'ì': 'i', 'í': 'i', 'ò': 'o', 'ó': 'o', 'ö': 'o', 'ô': 'o', 'ø': 'o', 'ù': 'o', 'ú': 'u', 'ü': 'u', 'û': 'u', 'ñ': 'n', 'ç': 'c', 'ß': 's', 'ÿ': 'y', 'œ': 'o', 'ŕ': 'r', 'ś': 's', 'ń': 'n', 'ṕ': 'p', 'ẃ': 'w', 'ǵ': 'g', 'ǹ': 'n', 'ḿ': 'm', 'ǘ': 'u', 'ẍ': 'x', 'ź': 'z', 'ḧ': 'h', '·': '-', '/': '-', '_': '-', ',': '-', ':': '-', ';': '-', 'З': '3', 'з': '3' };
exports.Slug = Slug;
class TableOfContentsProvider {
    constructor(engine, document) {
        this.engine = engine;
        this.document = document;
    }
    async getToc() {
        if (!this.toc) {
            try {
                this.toc = await this.buildToc(this.document);
            }
            catch (e) {
                this.toc = [];
            }
        }
        return this.toc;
    }
    async lookup(fragment) {
        const toc = await this.getToc();
        const slug = Slug.fromHeading(fragment);
        return toc.find(entry => entry.slug.equals(slug));
    }
    async buildToc(document) {
        const toc = [];
        const tokens = await this.engine.parse(document.uri, document.getText());
        for (const heading of tokens.filter(token => token.type === 'heading_open')) {
            const lineNumber = heading.map[0];
            const line = document.lineAt(lineNumber);
            toc.push({
                slug: Slug.fromHeading(line.text),
                text: TableOfContentsProvider.getHeaderText(line.text),
                level: TableOfContentsProvider.getHeaderLevel(heading.markup),
                line: lineNumber,
                location: new vscode.Location(document.uri, line.range)
            });
        }
        return toc;
    }
    static getHeaderLevel(markup) {
        if (markup === '=') {
            return 1;
        }
        else if (markup === '-') {
            return 2;
        }
        else { // '#', '##', ...
            return markup.length;
        }
    }
    static getHeaderText(header) {
        return header.replace(/^\s*#+\s*(.*?)\s*#*$/, (_, word) => word.trim());
    }
}
exports.TableOfContentsProvider = TableOfContentsProvider;
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/7c7da59c2333a1306c41e6e7b68d7f0caa7b3d45/extensions\markdown-language-features\out/tableOfContentsProvider.js.map
