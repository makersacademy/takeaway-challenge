const express = require('express')
//const session = require('express-session')
const router = express.Router()
const db = require('../db/databaseconnection')
const bcrypt = require('bcrypt')
const User = require('../src/user')


router.post('/login', async (req, res) => {
  user = User.authenticate(req.body.email, req.body.password, res)
  //next need to store this user ID in a session ID so they stay logged in
})

router.get('/', (req, res) => {
  res.send('Account management')
})

router.get('/new', (req, res) => {
  res.send('Sign up form')
})

router.post('/', async (req, res) => {
  try{
    const hashedPassword = await bcrypt.hash(req.body.password, 10)
    console.log(req.body.password)
    console.log(req.body.email)
    console.log(req.body.name)
    User.createUser(req.body.name, req.body.email, hashedPassword)
    res.send('Created user')
  } catch {
    res.status(500).send()
  }
})

router.get('/:id/orderhistory', (req, res, next) => {
  req.params.id
  db.query('SELECT * FROM orders WHERE user_id = $1', [req.params.id], (err, result) => {
    if (err) {
      return next(err)
    }
    res.send(result.rows[0])
  })
})

module.exports = router