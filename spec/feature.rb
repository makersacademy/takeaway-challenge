require './lib/order.rb'
require './lib/dish_list.rb'

o = Order.new
o.view_dishes
o.food_selection(:chicken_pesto)
o.food_selection(:chilli_chicken, 2)
o.price_tracker
