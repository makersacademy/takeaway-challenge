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
pizza = Dish.new("pizza", 10)
pasta = Dish.new("pasta", 15)
menu = Menu.new([pasta, pizza, pasta])
order = Order.new
restaurant = Restaurant.new
