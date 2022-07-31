const bcrypt = require('bcrypt');
const db = require('../db/databaseconnection')

//Create user function => stores in DB for sign up
//Create password encryption also 

class User {
  constructor(id, firstname, email){
    this.id = id
    this.firstname = firstname
    this.email = email
  }

  static async createUser(firstname, email, encrypted_password, callBack){
    let result = await db.query(
      "INSERT INTO users (name, email, password) VALUES($1, $2, $3) RETURNING id, name, email;",
      [firstname, email, encrypted_password]
    )
    new User(result.rows[0].id, result.rows[0].name, result.rows[0].email)
  }

  static async findUser(id){
    let result = await db.query(
      "SELECT * FROM users WHERE id = $1", [id]
    )
      new User(result.rows[0].id, result.rows[0].name, result.rows[0].email)
  }

  static async authenticate(email, password, res){
    let result = await db.query(
      "SELECT * FROM users WHERE email = $1", [email]
    )
    if(result.rows[0] == null){
      return res.status(400).send("Cannot find user")
    }
    try{
      if (await bcrypt.compare(password, result.rows[0].password)) {
        res.send('Success')
        new User(result.rows[0].id, result.rows[0].name, result.rows[0].email)
      } else{
        res.send('Email address or password is incorrect')
      }
    } catch {
      res.status(500).send()
    }
  }
}

module.exports = User 

