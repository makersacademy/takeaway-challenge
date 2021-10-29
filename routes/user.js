const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
  res.send('Order history')
})

router.get('/new', (req, res) => {
  res.send('Sign up form')
})

router.post('/', (req, res) => {
  res.send('Create user')
})

router.get('/:id', (req, res) => {
  req.params.id
  res.send(`Get user with ID ${req.params.id}`)
})

module.exports = router