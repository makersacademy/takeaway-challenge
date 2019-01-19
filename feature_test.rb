require './lib/order'
require './lib/takeaway'

takeaway = Takeaway.new
order = Order.new
menu = Menu.new

p takeaway.menu
#p takeaway.order
p order.menu
p order.order_summary
p menu.dish
