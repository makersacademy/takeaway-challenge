require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new
order = Order.new

p menu.print_menu
order.add_items("bruschetta", 5, 5)
order.add_items("pizza", 3, 7)
order.add_items("mango", 1, 10)
p order.view_order
p order.basket
p order.total