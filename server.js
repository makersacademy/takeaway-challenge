const express = require('express');
const app = express();
const port = 3000;
const Restaurant = require('./src/restaurant')
const Menu = require('./src/menu')
const User = require('./src/user')
const bcrypt = require('bcrypt')
const db = require('./db/databaseconnection')
let restaurant = new Restaurant("mcdees")

let menu = new Menu


app.use(express.json())
app.use(express.urlencoded({ extended: true }));

app.set('view engine', 'ejs')

app.get('/', (req, res) => {
  res.render('index', {list: menu.items});
})

app.get('/order/summary', (req, res) =>{
  res.render('order/summary', {summary: restaurant.currentOrder.dishes, order: restaurant.currentOrder, delivery: restaurant.delivery})
  console.log(restaurant.currentOrder.dishes[0])
})

app.post('/order/additem/:id', (req, res) => {
  restaurant.addItem(menu.findById(parseInt(req.params.id)))
  res.redirect('/')
  console.log(restaurant.currentOrder.dishes)
  //Next you need to make a way to go to the basket page
  //Which will give user an option to complete order
})

const userRouter = require('./routes/user')

app.use('/user', userRouter)

app.listen(port, () => {
  console.log(`Example app listening at http://localhost${port}`)
})