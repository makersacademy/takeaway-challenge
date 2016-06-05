require 'menu'
require 'order'
require 'total'

# Specification 1
menu = Menu.new
menu.show_menu

# Specification 2
order = Order.new
order.add("pork", 7)
order.add("duck", 2)
order.add("chicken", 6)

# Specification 3
order = Order.new
order.add("pork", 7)
order.add("chicken", 6)
total = Total.new(order)
total.show_total

# Specification 4
order = Order.new
order.add("pork", 7)
order.add("chicken", 6)
total = Total.new(order)
total.show_total
send_sms
