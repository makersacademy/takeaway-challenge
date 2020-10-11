require './lib/restaurant.rb'
require './lib/menu.rb'
require './lib/order.rb'

restaurant = Restaurant.new

restaurant.view_menu

restaurant.place_order("fries", 2)

p restaurant.order.total_cost.to_f
p restaurant.view_basket
p restaurant.confirm_order(2.58)
