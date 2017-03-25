require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new
menu.open
menu.new_order
menu.add_item(1)

order = Order.new
