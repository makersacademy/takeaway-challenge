require './lib/menu.rb'
require './lib/dish.rb'
require './lib/dish_printer.rb'
require './lib/order.rb'

menu = menu.new
order = order.new(menu)
dish_array = [
  ['Samosa', 1],
  ['Bhaji', 1.50],
  ['Daal', 5]
]

menu.populate_dishes_from_array(dish_array)
