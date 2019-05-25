require './lib/menu'
require './lib/order'

p menu = Menu.new
menu.print_menu

p order = Order.new
p order.add("pizza")
p order.add("pizza", 2)
p order

p order.total

p order.complete