const { Client } = require('pg')
const client = new Client({
  user: 'emmanuel',
  host: 'localhost',
  database: 'takeaway',
  port: 5432
})

client.connect()

module.exports = {
  query: (text, params, callBack) => {
    return client.query(text, params, callBack)
  }
}


/*
const query = 'INSERT INTO users(name, email) VALUES($1, $2) RETURNING *'
const values = ['joe', '1234567@gmail.com']

client.query(query, values, (err, res) => {
  if (err) {
    console.log(err.stack)
  } else {
    console.log(res.rows[0])
  }
})
*/