"use strict";
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
Object.defineProperty(exports, "__esModule", { value: true });
class Archetype {
    constructor(aid, gid, repo, desc) {
        this.artifactId = aid;
        this.groupId = gid;
        this.versions = [];
        this.description = desc;
        this.repository = repo;
    }
}
exports.Archetype = Archetype;
//# sourceMappingURL=Archetype.js.map