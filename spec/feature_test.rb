#for pasting into irb
require './lib/menu.rb'
require './lib/order.rb'
o = Order.new
o.add("pizza")
o.add("curry", 5)
o.check_order


expect(order.view).to eq({
  :curry => 10,
  :pizza => 12,
  :pasta => 8,
  :fish => 10,
  :beef => 18
})