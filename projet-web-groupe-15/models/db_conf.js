const config = require('../config');

const dbPath = require('better-sqlite3')(config.dbPath);
module.exports = dbPath;