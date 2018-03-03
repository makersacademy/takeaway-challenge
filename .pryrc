require './lib/menu.rb'
require './lib/dish.rb'

menu = Menu.new

dish_array = [
  ['Samosa', 1],
  ['Bhaji', 1.50],
  ['Daal', 5]
]

menu.populate_dishes_from_array(dish_array)
