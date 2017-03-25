require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new
menu.open
menu.new_order
menu.add_item(1)
menu.add_item(2)
menu.add_item(3)
menu.add_item(4)
menu.basket

order = Order.new
