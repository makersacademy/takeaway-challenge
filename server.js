const express = require('express');
const app = express();
const port = 3000;
const Restaurant = require('./src/restaurant')
const Menu = require('./src/menu')
let restaurant = new Restaurant("mcdees")

let menu = new Menu


app.use(express.json())
app.use(express.urlencoded({ extended: true }));

app.set('view engine', 'ejs')

app.get('/', (req, res) => {
  res.render('index', {list: menu.items});
})

app.post('/order/additem/:id', (req, res) => {
  restaurant.addItem(menu.findById(parseInt(req.params.id)))
  res.redirect('/')
})

const userRouter = require('./routes/user')

app.use('/user', userRouter)

app.listen(port, () => {
  console.log(`Example app listening at http://localhost${port}`)
})