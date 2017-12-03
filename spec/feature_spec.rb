require './lib/menu'
require './lib/order'
menu = Menu.new
menu.read_menu
order = Order.new
order.basket
