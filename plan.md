*Dish
  * #price
*Menu
  * #dishes
*Order
  * #dishes
  * #total
*Restaurant??
  * #send_text
*Customer??
  * #place_order


require "./lib/dish"
require "./lib/order"
require "./lib/menu"
require "./lib/restaurant"
require "./lib/texter"
pizza = Dish.new(name: "pizza", price: 10)
pasta = Dish.new(name: "pasta", price: 15)
menu = Menu.new([pasta, pizza, pasta])
order = Order.new
restaurant = Restaurant.new
