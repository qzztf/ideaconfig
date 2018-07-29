"use strict";
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const child_process = require("child_process");
const fse = require("fs-extra");
const http = require("http");
const https = require("https");
const md5 = require("md5");
const minimatch = require("minimatch");
const os = require("os");
const path = require("path");
const url = require("url");
const vscode_1 = require("vscode");
const xml2js = require("xml2js");
const Archetype_1 = require("./model/Archetype");
const ProjectItem_1 = require("./model/ProjectItem");
const VSCodeUI_1 = require("./VSCodeUI");
var Utils;
(function (Utils) {
    let EXTENSION_PUBLISHER;
    let EXTENSION_NAME;
    let EXTENSION_VERSION;
    let EXTENSION_AI_KEY;
    function loadPackageInfo(context) {
        return __awaiter(this, void 0, void 0, function* () {
            const { publisher, name, version, aiKey } = yield fse.readJSON(context.asAbsolutePath("./package.json"));
            EXTENSION_AI_KEY = aiKey;
            EXTENSION_PUBLISHER = publisher;
            EXTENSION_NAME = name;
            EXTENSION_VERSION = version;
        });
    }
    Utils.loadPackageInfo = loadPackageInfo;
    function getExtensionPublisher() {
        return EXTENSION_PUBLISHER;
    }
    Utils.getExtensionPublisher = getExtensionPublisher;
    function getExtensionName() {
        return EXTENSION_NAME;
    }
    Utils.getExtensionName = getExtensionName;
    function getExtensionId() {
        return `${EXTENSION_PUBLISHER}.${EXTENSION_NAME}`;
    }
    Utils.getExtensionId = getExtensionId;
    function getExtensionVersion() {
        return EXTENSION_VERSION;
    }
    Utils.getExtensionVersion = getExtensionVersion;
    function getAiKey() {
        return EXTENSION_AI_KEY;
    }
    Utils.getAiKey = getAiKey;
    function getTempFolderPath(...args) {
        return path.join(os.tmpdir(), EXTENSION_NAME, ...args);
    }
    Utils.getTempFolderPath = getTempFolderPath;
    function getTempFolder() {
        return path.join(os.tmpdir(), getExtensionId());
    }
    Utils.getTempFolder = getTempFolder;
    function getPathToExtensionRoot(...args) {
        return path.join(vscode_1.extensions.getExtension(getExtensionId()).extensionPath, ...args);
    }
    Utils.getPathToExtensionRoot = getPathToExtensionRoot;
    function getProject(absolutePath, workspacePath) {
        return __awaiter(this, void 0, void 0, function* () {
            if (yield fse.pathExists(absolutePath)) {
                const xml = yield fse.readFile(absolutePath, "utf8");
                const pom = yield readXmlContent(xml);
                if (pom && pom.project && pom.project.artifactId) {
                    const artifactId = pom.project.artifactId.toString();
                    const ret = new ProjectItem_1.ProjectItem(artifactId, workspacePath, absolutePath, { pom });
                    ret.collapsibleState = pom.project && pom.project.modules ? 1 : 0;
                    return ret;
                }
            }
            return null;
        });
    }
    Utils.getProject = getProject;
    function readXmlContent(xml, options) {
        return __awaiter(this, void 0, void 0, function* () {
            const opts = Object.assign({ explicitArray: true }, options);
            return new Promise((resolve, reject) => {
                xml2js.parseString(xml, opts, (err, res) => {
                    if (err) {
                        reject(err);
                    }
                    else {
                        resolve(res);
                    }
                });
            });
        });
    }
    Utils.readXmlContent = readXmlContent;
    function withLRUItemAhead(array, lruItem) {
        const ret = array.filter((elem) => elem !== lruItem).reverse();
        ret.push(lruItem);
        return ret.reverse();
    }
    Utils.withLRUItemAhead = withLRUItemAhead;
    function loadCmdHistory(pomXmlFilePath) {
        return __awaiter(this, void 0, void 0, function* () {
            const filepath = getCommandHistoryCachePath(pomXmlFilePath);
            if (yield fse.pathExists(filepath)) {
                const content = (yield fse.readFile(filepath)).toString().trim();
                if (content) {
                    return content.split("\n").map((line) => line.trim()).filter(Boolean);
                }
            }
            return [];
        });
    }
    Utils.loadCmdHistory = loadCmdHistory;
    function saveCmdHistory(pomXmlFilePath, cmdlist) {
        return __awaiter(this, void 0, void 0, function* () {
            const filepath = getCommandHistoryCachePath(pomXmlFilePath);
            yield fse.ensureFile(filepath);
            yield fse.writeFile(filepath, cmdlist.join("\n"));
        });
    }
    Utils.saveCmdHistory = saveCmdHistory;
    function getEffectivePomOutputPath(pomXmlFilePath) {
        return path.join(os.tmpdir(), EXTENSION_NAME, md5(pomXmlFilePath), "effective-pom.xml");
    }
    Utils.getEffectivePomOutputPath = getEffectivePomOutputPath;
    function getCommandHistoryCachePath(pomXmlFilePath) {
        return path.join(os.tmpdir(), EXTENSION_NAME, pomXmlFilePath ? md5(pomXmlFilePath) : "", "commandHistory.txt");
    }
    Utils.getCommandHistoryCachePath = getCommandHistoryCachePath;
    function readFileIfExists(filepath) {
        return __awaiter(this, void 0, void 0, function* () {
            if (yield fse.pathExists(filepath)) {
                return (yield fse.readFile(filepath)).toString();
            }
            return null;
        });
    }
    Utils.readFileIfExists = readFileIfExists;
    function listArchetypeFromXml(xml) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const catalogRoot = yield readXmlContent(xml);
                if (catalogRoot && catalogRoot["archetype-catalog"]) {
                    const dict = {};
                    catalogRoot["archetype-catalog"].archetypes.forEach((archetypes) => {
                        archetypes.archetype.forEach((archetype) => {
                            const groupId = archetype.groupId && archetype.groupId.toString();
                            const artifactId = archetype.artifactId && archetype.artifactId.toString();
                            const description = archetype.description && archetype.description.toString();
                            const version = archetype.version && archetype.version.toString();
                            const repository = archetype.repository && archetype.repository.toString();
                            const identifier = `${groupId}:${artifactId}`;
                            if (!dict[identifier]) {
                                dict[identifier] =
                                    new Archetype_1.Archetype(artifactId, groupId, repository, description);
                            }
                            if (dict[identifier].versions.indexOf(version) < 0) {
                                dict[identifier].versions.push(version);
                            }
                        });
                    });
                    return Object.keys(dict).map((k) => dict[k]);
                }
            }
            catch (err) {
                // do nothing
            }
            return [];
        });
    }
    Utils.listArchetypeFromXml = listArchetypeFromXml;
    function getLocalArchetypeCatalogFilePath() {
        return path.join(os.homedir(), ".m2", "repository", "archetype-catalog.xml");
    }
    Utils.getLocalArchetypeCatalogFilePath = getLocalArchetypeCatalogFilePath;
    function getProvidedArchetypeCatalogFilePath() {
        return path.join(Utils.getPathToExtensionRoot(), "resources", "archetype-catalog.xml");
    }
    Utils.getProvidedArchetypeCatalogFilePath = getProvidedArchetypeCatalogFilePath;
    function downloadFile(targetUrl, readContent, customHeaders) {
        return __awaiter(this, void 0, void 0, function* () {
            const tempFilePath = path.join(getTempFolder(), md5(targetUrl));
            yield fse.ensureDir(getTempFolder());
            if (yield fse.pathExists(tempFilePath)) {
                yield fse.remove(tempFilePath);
            }
            return yield new Promise((resolve, reject) => {
                const urlObj = url.parse(targetUrl);
                const options = Object.assign({ headers: Object.assign({}, customHeaders, { 'User-Agent': `vscode/${getExtensionVersion()}` }) }, urlObj);
                let client;
                if (urlObj.protocol === "https:") {
                    client = https;
                    // tslint:disable-next-line:no-http-string
                }
                else if (urlObj.protocol === "http:") {
                    client = http;
                }
                else {
                    return reject(new Error("Unsupported protocol."));
                }
                client.get(options, (res) => {
                    let rawData;
                    let ws;
                    if (readContent) {
                        rawData = "";
                    }
                    else {
                        ws = fse.createWriteStream(tempFilePath);
                    }
                    res.on('data', (chunk) => {
                        if (readContent) {
                            rawData += chunk;
                        }
                        else {
                            ws.write(chunk);
                        }
                    });
                    res.on('end', () => {
                        if (readContent) {
                            resolve(rawData);
                        }
                        else {
                            ws.end();
                            resolve(tempFilePath);
                        }
                    });
                }).on("error", (err) => {
                    reject(err);
                });
            });
        });
    }
    Utils.downloadFile = downloadFile;
    function findAllInDir(currentPath, targetFileName, depth, exclusion = ["**/.*"]) {
        return __awaiter(this, void 0, void 0, function* () {
            if (exclusion) {
                for (const pattern of exclusion) {
                    if (minimatch(currentPath, pattern)) {
                        return [];
                    }
                }
            }
            const ret = [];
            // `depth < 0` means infinite
            if (depth !== 0 && (yield fse.pathExists(currentPath))) {
                const stat = yield fse.lstat(currentPath);
                if (stat.isDirectory()) {
                    const filenames = yield fse.readdir(currentPath);
                    for (const filename of filenames) {
                        const filepath = path.join(currentPath, filename);
                        const results = yield findAllInDir(filepath, targetFileName, depth - 1, exclusion);
                        for (const result of results) {
                            ret.push(result);
                        }
                    }
                }
                else if (path.basename(currentPath).toLowerCase() === targetFileName) {
                    ret.push(currentPath);
                }
            }
            return ret;
        });
    }
    Utils.findAllInDir = findAllInDir;
    function getMavenExecutable() {
        const mavenPath = vscode_1.workspace.getConfiguration("maven.executable").get("path");
        return mavenPath ? `"${mavenPath}"` : "mvn";
    }
    Utils.getMavenExecutable = getMavenExecutable;
    function executeMavenCommand(command, pomfile) {
        const fullCommand = [
            Utils.getMavenExecutable(),
            command.trim(),
            "-f",
            `"${formattedFilepath(pomfile)}"`,
            vscode_1.workspace.getConfiguration("maven.executable", vscode_1.Uri.file(pomfile)).get("options")
        ].filter((x) => x).join(" ");
        const name = "Maven";
        VSCodeUI_1.VSCodeUI.runInTerminal(fullCommand, { name });
        updateLRUCommands(command, pomfile);
    }
    Utils.executeMavenCommand = executeMavenCommand;
    function getLRUCommands(pomfile) {
        return __awaiter(this, void 0, void 0, function* () {
            const filepath = getCommandHistoryCachePath();
            if (yield fse.pathExists(filepath)) {
                const content = (yield fse.readFile(filepath)).toString().trim();
                if (content) {
                    return content.split("\n").map((line) => {
                        const items = line.split(",");
                        return { command: items[0], pomfile: items[1] };
                    }).filter((item) => !pomfile || pomfile === item.pomfile);
                }
            }
            return [];
        });
    }
    Utils.getLRUCommands = getLRUCommands;
    function updateLRUCommands(command, pomfile) {
        return __awaiter(this, void 0, void 0, function* () {
            const filepath = getCommandHistoryCachePath();
            yield fse.ensureFile(filepath);
            const content = (yield fse.readFile(filepath)).toString().trim();
            const lines = withLRUItemAhead(content.split("\n"), `${command},${pomfile}`);
            const newContent = lines.filter(Boolean).slice(0, 20).join("\n");
            yield fse.writeFile(filepath, newContent);
        });
    }
    function currentWindowsShell() {
        const is32ProcessOn64Windows = process.env.hasOwnProperty('PROCESSOR_ARCHITEW6432');
        const system32Path = `${process.env.windir}\\${is32ProcessOn64Windows ? 'Sysnative' : 'System32'}`;
        const expectedLocations = {
            'Command Prompt': [`${system32Path}\\cmd.exe`],
            PowerShell: [`${system32Path}\\WindowsPowerShell\\v1.0\\powershell.exe`],
            'WSL Bash': [`${system32Path}\\bash.exe`],
            'Git Bash': [
                `${process.env.ProgramW6432}\\Git\\bin\\bash.exe`,
                `${process.env.ProgramW6432}\\Git\\usr\\bin\\bash.exe`,
                `${process.env.ProgramFiles}\\Git\\bin\\bash.exe`,
                `${process.env.ProgramFiles}\\Git\\usr\\bin\\bash.exe`,
                `${process.env.LocalAppData}\\Programs\\Git\\bin\\bash.exe`
            ]
        };
        const currentWindowsShellPath = vscode_1.workspace.getConfiguration("terminal").get("integrated.shell.windows");
        for (const key in expectedLocations) {
            if (expectedLocations[key].indexOf(currentWindowsShellPath) >= 0) {
                return key;
            }
        }
        return 'Others';
    }
    Utils.currentWindowsShell = currentWindowsShell;
    function toWSLPath(p) {
        const arr = p.split(":\\");
        if (arr.length === 2) {
            const drive = arr[0].toLowerCase();
            const dir = arr[1].replace(/\\/g, "/");
            return `/mnt/${drive}/${dir}`;
        }
        else {
            return ".";
        }
    }
    Utils.toWSLPath = toWSLPath;
    function formattedFilepath(filepath) {
        if (process.platform === "win32") {
            switch (currentWindowsShell()) {
                case "WSL Bash":
                    return toWSLPath(filepath);
                default:
                    return filepath;
            }
        }
        else {
            return filepath;
        }
    }
    Utils.formattedFilepath = formattedFilepath;
    function getMavenVersion() {
        return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
            const customEnv = VSCodeUI_1.VSCodeUI.setupEnvironment();
            const mvnExecutablePath = vscode_1.workspace.getConfiguration("maven.executable").get("path") || "mvn";
            let mvnExecutableAbsolutePath = mvnExecutablePath;
            if (vscode_1.workspace.workspaceFolders && vscode_1.workspace.workspaceFolders.length) {
                for (const ws of vscode_1.workspace.workspaceFolders) {
                    if (yield fse.exists(path.resolve(ws.uri.fsPath, mvnExecutablePath))) {
                        mvnExecutableAbsolutePath = path.resolve(ws.uri.fsPath, mvnExecutablePath);
                        break;
                    }
                }
            }
            const execOptions = {
                cwd: mvnExecutableAbsolutePath && path.dirname(mvnExecutableAbsolutePath),
                env: Object.assign({}, process.env, customEnv)
            };
            child_process.exec(`${Utils.getMavenExecutable()} --version`, execOptions, (error, _stdout, _stderr) => {
                if (error) {
                    reject(error);
                }
                else {
                    resolve();
                }
            });
        }));
    }
    Utils.getMavenVersion = getMavenVersion;
})(Utils = exports.Utils || (exports.Utils = {}));
//# sourceMappingURL=Utils.js.map