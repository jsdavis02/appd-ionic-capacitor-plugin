//
//  Copyright (c) 2019 AppDynamics Technologies. All rights reserved.
//  THIS IS UNPUBLISHED PROPRIETARY CODE OF APPDYNAMICS, INC.
//  The copyright notice above does not evidence any actual or intended publication of such source code
//
const fs = require('fs');
const path = require('path');

// Usage: node set-plugin-version.js <path-to-cordova-plugin-base-dir> <version>

const pluginDir = process.argv[2];
const version = process.argv[3];
const packageFile = path.join(pluginDir, '/package.json');

if (!version) {
    console.log('No version number supplied!');
    process.exit(1);
}

console.log(`Setting project "${pluginDir}" to version ${version}`);

const packageData = require(packageFile);
if (packageData.version != version) {
    packageData.version = version;
    fs.writeFileSync(packageFile, JSON.stringify(packageData, null, 4));
}
