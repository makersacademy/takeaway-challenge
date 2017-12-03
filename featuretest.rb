require './lib/menu.rb'
require './lib/order.rb'

p menu = Menu.new
p order = Order.new

menu.print_menu
p order.request_item("Lunch")
p order.request_item("Dinner")
p order.request_item("Dinner")
p order.order[-1]
p order.total_price
