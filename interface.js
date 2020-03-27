var pg = require('pg');
var connectionString = "postgres://userName:password@serverName/ip:port/nameOfDatabase";
pgClient.connect();
var query = pgClient.query("SELECT * from Menu")
