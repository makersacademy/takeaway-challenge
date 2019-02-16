require "./lib/menu.rb"
require "./lib/order.rb"

m = Menu.new
m.view

o = Order.new
o.price_look_up("chips")
o.select_dish("chips", 2)
o.price_look_up

o.select_dish("chicken chow mein")
o.select_dish("doner kebab", 4)

# dish, quantity = 1
o.submit_total

o.view_basket

### new class
o.place_order
### CHEKCER PLACES ORDER
# raise error if sum is not correct. Place order if it is correct
