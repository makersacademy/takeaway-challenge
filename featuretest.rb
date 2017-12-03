require './lib/menu.rb'
require './lib/order.rb'

p menu = Menu.new
p order = Order.new

menu.print_menu
# p order.request_item("Lunch", "Dinner", "Breakfast")
# p order.request_item("Dinner")
# p order.request_item("Dinner")
# p order.order
# p order.total_price
