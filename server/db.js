const Pool = require("pg").Pool;

const pool = new Pool({
    user: "postgres",
    password: "2542",
    host: "localhost",
    port: "5000",
    database: "postgres"
});

module.exports = pool;