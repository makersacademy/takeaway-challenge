const express = require('express');
const app = express();
const port = 3000;
const Restaurant = require('./src/restaurant')
let restaurant = new Restaurant("mcdees")

app.use(express.json())
app.use(express.urlencoded({ extended: false }));

app.get('/', (req, res) => {
  res.json(restaurant.listMenu())
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost${port}`)
})