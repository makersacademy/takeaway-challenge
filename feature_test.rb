require './lib/order'
require './lib/takeaway'

takeaway = Takeaway.new
order = Order.new
menu = Menu.new

p takeaway.read_menu
takeaway.add_order(:seafood,1)
takeaway.add_order(:garlic_bread,2)
takeaway.add_order(:romana,1)
takeaway.checkout
p takeaway.bill_summary
