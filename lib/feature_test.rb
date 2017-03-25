require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new
menu.open
menu.create_new_order
menu.select_item(1)
menu.select_item(3)
menu.select_item(4)
menu.review_order
menu.remove_item(1)
menu.review_order

order = Order.new
