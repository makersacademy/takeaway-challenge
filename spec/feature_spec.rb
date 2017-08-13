require "./lib/order.rb"
require "./lib/menu.rb"
nandos = Order.new
nandos.add_order("Lobster", 2)
nandos.add_order("Pizza", 4)
nandos.add_order("Halloumi")
nandos.add_order("Salmon", 2)
nandos.add_order("Halloumi")
nandos.order_list
nandos.order_total
nandos.show_basket
