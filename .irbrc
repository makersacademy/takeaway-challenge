require './lib/menu.rb'
require './lib/dish.rb'
require './lib/dish_printer.rb'
require './lib/order.rb'
require './lib/texter.rb'

menu = Menu.new
order = Order.new
texter = Texter.new

dish_array = [
  ['Samosa', 1],
  ['Bhaji', 1.50],
  ['Daal', 5]
]
menu.populate_dishes_from_array(dish_array)
order.change_menu(menu)
