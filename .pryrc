require "./lib/takeaway.rb"
require "./lib/menu.rb"
require "./lib/order.rb"

t = Takeaway.new
t.menu.add_dish("Risotto con funghi porcini", 4.25)
t.menu.add_dish("Tomato and basil soup", 2.95)
t.menu.add_dish("Pizza Margherita", 5.30)
