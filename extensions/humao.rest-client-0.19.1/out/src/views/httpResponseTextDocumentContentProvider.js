"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const baseTextDocumentContentProvider_1 = require("./baseTextDocumentContentProvider");
const mimeUtility_1 = require("../mimeUtility");
const responseFormatUtility_1 = require("../responseFormatUtility");
const responseStore_1 = require("../responseStore");
const previewOption_1 = require("../models/previewOption");
const Constants = require("../constants");
const path = require("path");
const autoLinker = require('autolinker');
const hljs = require('highlight.js');
class HttpResponseTextDocumentContentProvider extends baseTextDocumentContentProvider_1.BaseTextDocumentContentProvider {
    constructor(settings) {
        super();
        this.settings = settings;
    }
    provideTextDocumentContent(uri) {
        if (uri) {
            let response = responseStore_1.ResponseStore.get(uri.toString());
            if (response) {
                let innerHtml;
                let width = 2;
                let contentType = response.getHeader("content-type");
                if (contentType) {
                    contentType = contentType.trim();
                }
                if (contentType && mimeUtility_1.MimeUtility.isBrowserSupportedImageFormat(contentType)) {
                    innerHtml = `<img src="data:${contentType};base64,${new Buffer(response.bodyStream).toString('base64')}">`;
                }
                else {
                    let code = this.highlightResponse(response);
                    width = (code.split(/\r\n|\r|\n/).length + 1).toString().length;
                    innerHtml = `<pre><code>${this.addLineNums(code)}</code></pre>`;
                }
                return `
            <head>
                <link rel="stylesheet" type="text/css" href="${HttpResponseTextDocumentContentProvider.cssFilePath}">
                ${this.getSettingsOverrideStyles(width)}
            </head>
            <body>
                <div>
                    ${this.settings.disableAddingHrefLinkForLargeResponse && response.bodySizeInBytes > this.settings.largeResponseBodySizeLimitInMB * 1024 * 1024
                    ? innerHtml
                    : this.addUrlLinks(innerHtml)}
                    <a id="scroll-to-top" role="button" aria-label="scroll to top" onclick="scroll(0,0)"><span class="icon"></span></a>
                </div>
                <script type="text/javascript" src="${HttpResponseTextDocumentContentProvider.scriptFilePath}" charset="UTF-8"></script>
            </body>`;
            }
        }
    }
    highlightResponse(response) {
        let code = '';
        let previewOption = this.settings.previewOption;
        if (previewOption === previewOption_1.PreviewOption.Exchange) {
            // for add request details
            let request = response.request;
            let requestNonBodyPart = `${request.method} ${request.url} HTTP/1.1
${HttpResponseTextDocumentContentProvider.formatHeaders(request.headers)}`;
            code += hljs.highlight('http', requestNonBodyPart + '\r\n').value;
            if (request.body) {
                let requestContentType = request.getHeader("content-type");
                if (typeof request.body !== 'string') {
                    request.body = 'NOTE: Request Body From File Not Shown';
                }
                let requestBodyPart = `${responseFormatUtility_1.ResponseFormatUtility.FormatBody(request.body.toString(), requestContentType, true)}`;
                let bodyLanguageAlias = HttpResponseTextDocumentContentProvider.getHighlightLanguageAlias(requestContentType);
                if (bodyLanguageAlias) {
                    code += hljs.highlight(bodyLanguageAlias, requestBodyPart).value;
                }
                else {
                    code += hljs.highlightAuto(requestBodyPart).value;
                }
                code += '\r\n';
            }
            code += '\r\n'.repeat(2);
        }
        if (previewOption !== previewOption_1.PreviewOption.Body) {
            let responseNonBodyPart = `HTTP/${response.httpVersion} ${response.statusCode} ${response.statusMessage}
${HttpResponseTextDocumentContentProvider.formatHeaders(response.headers)}`;
            code += hljs.highlight('http', responseNonBodyPart + (previewOption !== previewOption_1.PreviewOption.Headers ? '\r\n' : '')).value;
        }
        if (previewOption !== previewOption_1.PreviewOption.Headers) {
            let responseContentType = response.getHeader("content-type");
            let responseBodyPart = `${responseFormatUtility_1.ResponseFormatUtility.FormatBody(response.body, responseContentType, this.settings.suppressResponseBodyContentTypeValidationWarning)}`;
            if (this.settings.disableHighlightResonseBodyForLargeResponse &&
                response.bodySizeInBytes > this.settings.largeResponseBodySizeLimitInMB * 1024 * 1024) {
                code += responseBodyPart;
            }
            else {
                let bodyLanguageAlias = HttpResponseTextDocumentContentProvider.getHighlightLanguageAlias(responseContentType);
                if (bodyLanguageAlias) {
                    code += hljs.highlight(bodyLanguageAlias, responseBodyPart).value;
                }
                else {
                    code += hljs.highlightAuto(responseBodyPart).value;
                }
            }
        }
        return code;
    }
    getSettingsOverrideStyles(width) {
        return [
            '<style>',
            (this.settings.fontFamily || this.settings.fontSize || this.settings.fontWeight ? [
                'code {',
                this.settings.fontFamily ? `font-family: ${this.settings.fontFamily};` : '',
                this.settings.fontSize ? `font-size: ${this.settings.fontSize}px;` : '',
                this.settings.fontWeight ? `font-weight: ${this.settings.fontWeight};` : '',
                '}',
            ] : []).join('\n'),
            'code .line {',
            `padding-left: calc(${width}ch + 20px );`,
            '}',
            'code .line:before {',
            `width: ${width}ch;`,
            `margin-left: calc(-${width}ch + -30px );`,
            '}',
            '.line .icon {',
            `left: calc(${width}ch + 3px)`,
            '}',
            '.line.collapsed .icon {',
            `left: calc(${width}ch + 3px)`,
            '}',
            '</style>'
        ].join('\n');
    }
    addLineNums(code) {
        code = code.replace(/([\r\n]\s*)(<\/span>)/ig, '$2$1');
        code = this.cleanLineBreaks(code);
        code = code.split(/\r\n|\r|\n/);
        let max = (1 + code.length).toString().length;
        const foldingRanges = this.getFoldingRange(code);
        code = code
            .map(function (line, i) {
            const lineNum = i + 1;
            const range = foldingRanges.has(lineNum)
                ? ` range-start="${foldingRanges.get(lineNum).start}" range-end="${foldingRanges.get(lineNum).end}"`
                : '';
            const folding = foldingRanges.has(lineNum) ? '<span class="icon"></span>' : '';
            return `<span class="line width-${max}" start="${lineNum}"${range}>${line}${folding}</span>`;
        })
            .join('\n');
        return code;
    }
    cleanLineBreaks(code) {
        let openSpans = [], matcher = /<\/?span[^>]*>|\r\n|\r|\n/ig, newline = /\r\n|\r|\n/, closingTag = /^<\//;
        return code.replace(matcher, function (match) {
            if (newline.test(match)) {
                if (openSpans.length) {
                    return openSpans.map(() => '</span>').join('') + match + openSpans.join('');
                }
                else {
                    return match;
                }
            }
            else if (closingTag.test(match)) {
                openSpans.pop();
                return match;
            }
            else {
                openSpans.push(match);
                return match;
            }
        });
    }
    addUrlLinks(innerHtml) {
        return innerHtml = autoLinker.link(innerHtml, {
            urls: {
                schemeMatches: true,
                wwwMatches: true,
                tldMatches: false
            },
            email: false,
            phone: false,
            stripPrefix: false,
            stripTrailingSlash: false
        });
    }
    getFoldingRange(lines) {
        const result = new Map();
        const stack = [];
        const leadingSpaceCount = lines
            .map((line, index) => [index, line.search(/\S/)])
            .filter(([, num]) => num !== -1);
        for (const [index, [lineIndex, count]] of leadingSpaceCount.entries()) {
            if (index === 0) {
                continue;
            }
            const [prevLineIndex, prevCount] = leadingSpaceCount[index - 1];
            if (prevCount < count) {
                stack.push([prevLineIndex, prevCount]);
            }
            else if (prevCount > count) {
                let prev;
                while ((prev = stack.slice(-1)[0]) && (prev[1] >= count)) {
                    stack.pop();
                    result.set(prev[0] + 1, new FoldingRange(prev[0] + 1, lineIndex));
                }
            }
        }
        return result;
    }
    static formatHeaders(headers) {
        let headerString = '';
        for (let header in headers) {
            if (headers.hasOwnProperty(header)) {
                let value = headers[header];
                if (typeof headers[header] !== 'string') {
                    value = headers[header];
                }
                headerString += `${header}: ${value}\n`;
            }
        }
        return headerString;
    }
    static getHighlightLanguageAlias(contentType) {
        if (mimeUtility_1.MimeUtility.isJSON(contentType)) {
            return 'json';
        }
        else if (mimeUtility_1.MimeUtility.isJavascript(contentType)) {
            return 'javascript';
        }
        else if (mimeUtility_1.MimeUtility.isXml(contentType)) {
            return 'xml';
        }
        else if (mimeUtility_1.MimeUtility.isHtml(contentType)) {
            return 'html';
        }
        else {
            return null;
        }
    }
}
HttpResponseTextDocumentContentProvider.cssFilePath = vscode_1.Uri.file(path.join(vscode_1.extensions.getExtension(Constants.ExtensionId).extensionPath, Constants.CSSFolderName, Constants.CSSFileName)).toString();
HttpResponseTextDocumentContentProvider.scriptFilePath = vscode_1.Uri.file(path.join(vscode_1.extensions.getExtension(Constants.ExtensionId).extensionPath, Constants.ScriptsFolderName, Constants.ScriptFileName)).toString();
exports.HttpResponseTextDocumentContentProvider = HttpResponseTextDocumentContentProvider;
class FoldingRange {
    constructor(start, end) {
        this.start = start;
        this.end = end;
    }
}
//# sourceMappingURL=httpResponseTextDocumentContentProvider.js.map