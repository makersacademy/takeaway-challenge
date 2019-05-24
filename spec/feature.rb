require './lib/order.rb'
require './lib/dish_list.rb'

l = DishList.new
o = Order.new
o.view_dishes

l.menu
