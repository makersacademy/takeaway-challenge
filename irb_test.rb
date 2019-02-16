require "./lib/menu.rb"
require "./lib/order.rb"
require "./lib/total_checker.rb"

m = Menu.new
m.view

o = Order.new
o.price_look_up("chips")
o.select_dish("chips", 2)
o.select_dish("chicken chow mein")
o.select_dish("doner kebab", 4)
o.total
o.total_checker(17.60)
o.place_order


t = TotalChecker.new
t.check(12.80)


o.submit_total



### new class
o.place_order
### CHEKCER PLACES ORDER
# raise error if sum is not correct. Place order if it is correct
