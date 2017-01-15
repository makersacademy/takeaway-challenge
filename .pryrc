require './lib/dishes.rb'
require './lib/menu.rb'
require './lib/order.rb'
menu = Menu.new
noodles = Dish.new('noodles', 5)
dumplings = Dish.new('dumplings', 3)
order = Order.new
menu.add_dish(noodles)
menu.add_dish(dumplings)
menu.show_items
order.add_to_order(noodles)
order.add_to_order(dumplings)
