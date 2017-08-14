require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new
order = Order.new

p menu.print_menu
order.add_items("bruschetta", 5, 5)
p order.view_order
p order.basket
p order.total
p order.place_order(25)
