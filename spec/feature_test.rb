require './lib/restaurant.rb'
require './lib/menu.rb'
require './lib/order.rb'

restaurant = Restaurant.new

restaurant.view_menu

restaurant.place_order("hamburger", 3)
restaurant.place_order("chicken nuggets", 6)

p restaurant.order.total_cost.to_f
p restaurant.view_basket
