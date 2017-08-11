require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new
order = Order.new

p menu.print_menu
p order.add_items(1, 2)
p order.add_items(2, 3)
p order.view_order