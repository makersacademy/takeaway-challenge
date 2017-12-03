require './lib/menu'
require './lib/order'
menu = Menu.new
menu.read_menu
order = Order.new
order.basket
order.add_order("spring rolls")
order.add_order("bun thit nuong", 2)
order.basket
["Spring Rolls", "Bun Thit Nuong", "Bun Thit Nuong"]
