#for pasting into irb
require './lib/menu.rb'
require './lib/order.rb'
o = Order.new
o.add("pizza")
o.add("curry", 5)
o.check_order
