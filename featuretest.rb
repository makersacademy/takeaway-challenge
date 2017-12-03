require './lib/menu.rb'
require './lib/order.rb'
require './lib/interface.rb'

p menu = Menu.new
p order = Order.new
# order.print_menu
order.request_item("Lunch", "Dinner", "Breakfast")
order.request_item("Dinner")
order.request_item("Dinner")
order.request_item("Lunch")
order.request_item("Dinner")
order.print_order



# interface = Interface.new
# interface.print_interface
# interface.option_select
