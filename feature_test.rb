require './lib/menu.rb'
require './lib/takeaway.rb'
require './lib/order.rb'

menu = Menu.new

curry = Dish.new "Curry", 7

menu.add(curry)
