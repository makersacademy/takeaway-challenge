require './lib/takeaway.rb'
require './lib/order.rb'
o = Order.new
t = TakeAway.new(o)


t.select("Burger", 2)
t.select("Salad", 1)
t.select("Hummus", 1)
