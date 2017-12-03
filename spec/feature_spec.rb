require './lib/menu'
require './lib/order'
menu = Menu.new
menu.read_menu
order = Order.new
order.basket
order.add_item("spring rolls")
order.add_item("bun thit nuong", 2)
order.add_item("pho", 3)
order.basket
order.price
order.basket_summary
