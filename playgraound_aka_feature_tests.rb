require_relative './lib/menu.rb'
require_relative './lib/restaurant.rb'
p rex = Restaurant.new
rex.menu.show_menu
rex.order(dish, quantity)
