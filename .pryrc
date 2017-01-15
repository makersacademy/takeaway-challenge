require './lib/restaurant'
require './lib/dish'
require './lib/menu'
require './lib/order'
require './lib/messenger'



choripan = Dish.new(:choripan, 5.95)
milanesa = Dish.new(:milanesa, 7.95)
empanada = Dish.new(:empanada, 2.95)
lomito = Dish.new(:lomito, 12.75)

menu1 = Menu.new(choripan, lomito, milanesa, empanada)
menu2 = Menu.new(empanada, milanesa)


order1 = Order.new(menu1)
order1.add_item(lomito)
order1.add_item(empanada, 6)

moo = Restaurant.new(order1)
