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
const fs = require("fs-extra");
const path = require("path");
const vscode_1 = require("vscode");
const vscode_extension_telemetry_wrapper_1 = require("vscode-extension-telemetry-wrapper");
const Archetype_1 = require("./model/Archetype");
const Utils_1 = require("./Utils");
const VSCodeUI_1 = require("./VSCodeUI");
// tslint:disable-next-line:no-http-string
const REMOTE_ARCHETYPE_CATALOG_URL = "http://repo.maven.apache.org/maven2/archetype-catalog.xml";
const POPULAR_ARCHETYPES_URL = "https://vscodemaventelemetry.blob.core.windows.net/public/popular_archetypes.json";
class Step {
    constructor(name, info) {
        this.name = name;
        this.info = info;
    }
}
const stepTargetFolder = new Step("TargetFolder", "Target folder selected.");
const stepListMore = new Step("ListMore", "All archetypes listed.");
const stepArchetype = new Step("Archetype", "Archetype selected.");
function finishStep(step) {
    const session = vscode_extension_telemetry_wrapper_1.TelemetryWrapper.currentSession();
    if (session && session.extraProperties) {
        if (!session.extraProperties.finishedSteps) {
            session.extraProperties.finishedSteps = [];
        }
        session.extraProperties.finishedSteps.push(step.name);
    }
    vscode_extension_telemetry_wrapper_1.TelemetryWrapper.info(step.info);
}
var ArchetypeModule;
(function (ArchetypeModule) {
    function generateFromArchetype(entry) {
        return __awaiter(this, void 0, void 0, function* () {
            let cwd = null;
            const result = yield VSCodeUI_1.VSCodeUI.openDialogForFolder({
                defaultUri: entry && entry.fsPath ? vscode_1.Uri.file(entry.fsPath) : undefined,
                openLabel: "Select Destination Folder"
            });
            if (result && result.fsPath) {
                cwd = result.fsPath;
                finishStep(stepTargetFolder);
                yield selectArchetypesSteps(cwd);
            }
        });
    }
    ArchetypeModule.generateFromArchetype = generateFromArchetype;
    function updateArchetypeCatalog() {
        return __awaiter(this, void 0, void 0, function* () {
            const xml = yield Utils_1.Utils.downloadFile(REMOTE_ARCHETYPE_CATALOG_URL, true);
            const archetypes = yield Utils_1.Utils.listArchetypeFromXml(xml);
            const targetFilePath = path.join(Utils_1.Utils.getPathToExtensionRoot(), "resources", "archetypes.json");
            yield fs.ensureFile(targetFilePath);
            yield fs.writeJSON(targetFilePath, archetypes);
        });
    }
    ArchetypeModule.updateArchetypeCatalog = updateArchetypeCatalog;
    function showQuickPickForArchetypes(options) {
        return __awaiter(this, void 0, void 0, function* () {
            return yield VSCodeUI_1.VSCodeUI.getQuickPick(loadArchetypePickItems(options), (item) => item.artifactId ? `$(package) ${item.artifactId} ` : "More ...", (item) => item.groupId ? `${item.groupId}` : "", (item) => item.description, { matchOnDescription: true, placeHolder: "Select an archetype ..." });
        });
    }
    function selectArchetypesSteps(cwd) {
        return __awaiter(this, void 0, void 0, function* () {
            let selectedArchetype = yield showQuickPickForArchetypes();
            if (selectedArchetype === undefined) {
                return;
            }
            else if (!selectedArchetype.artifactId) {
                finishStep(stepListMore);
                selectedArchetype = yield showQuickPickForArchetypes({ all: true });
            }
            if (selectedArchetype) {
                const { artifactId, groupId } = selectedArchetype;
                const session = vscode_extension_telemetry_wrapper_1.TelemetryWrapper.currentSession();
                if (session && session.extraProperties) {
                    session.extraProperties.artifactId = artifactId;
                    session.extraProperties.groupId = groupId;
                }
                finishStep(stepArchetype);
                const cmd = [
                    Utils_1.Utils.getMavenExecutable(),
                    "archetype:generate",
                    `-DarchetypeArtifactId="${artifactId}"`,
                    `-DarchetypeGroupId="${groupId}"`
                ].join(" ");
                VSCodeUI_1.VSCodeUI.runInTerminal(cmd, { cwd, name: "Maven-Archetype" });
            }
        });
    }
    function loadArchetypePickItems(options) {
        return __awaiter(this, void 0, void 0, function* () {
            const contentPath = Utils_1.Utils.getPathToExtensionRoot("resources", "archetypes.json");
            if (yield fs.pathExists(contentPath)) {
                const allItems = yield fs.readJSON(contentPath);
                if (options && options.all) {
                    return allItems;
                }
                else {
                    const items = yield getRecomendedItems(allItems);
                    return [new Archetype_1.Archetype(null, null, null, "Find more archetypes available in remote catalog.")].concat(items);
                }
            }
            return [];
        });
    }
    function getRecomendedItems(allItems) {
        return __awaiter(this, void 0, void 0, function* () {
            // Top popular archetypes according to usage data
            let fixedList;
            try {
                const rawlist = yield Utils_1.Utils.downloadFile(POPULAR_ARCHETYPES_URL, true);
                fixedList = JSON.parse(rawlist);
            }
            catch (error) {
                fixedList = [
                    "org.apache.maven.archetypes:maven-archetype-quickstart",
                    "org.apache.maven.archetypes:maven-archetype-archetype",
                    "org.apache.maven.archetypes:maven-archetype-webapp",
                    "org.apache.maven.archetypes:maven-archetype-j2ee-simple",
                    "com.microsoft.azure:azure-functions-archetype",
                    "am.ik.archetype:maven-reactjs-blank-archetype",
                    "com.microsoft.azure.gateway.archetypes:gateway-module-simple",
                    "org.apache.maven.archetypes:maven-archetype-site-simple",
                    "com.github.ngeor:archetype-quickstart-jdk8",
                    "org.apache.maven.archetypes:maven-archetype-plugin"
                ];
            }
            return fixedList.map((fullname) => allItems.find((item) => fullname === `${item.groupId}:${item.artifactId}`));
        });
    }
})(ArchetypeModule = exports.ArchetypeModule || (exports.ArchetypeModule = {}));
//# sourceMappingURL=ArchetypeModule.js.map