require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new
menu.open
menu.create_new_order
menu.select_item(1)
menu.select_item(3)
menu.new_order.basket

menu.review_order
menu.remove_item(1)


order = Order.new
