require './lib/menu'
require './lib/order'
menu = Menu.new
order = Order.new

order.make_order('spring rolls', 2)

order.basket


order.check_order
