require "./lib/menu.rb"
require "./lib/order.rb"
require "./lib/total_checker.rb"
require "./lib/text.rb"
require "./lib/send-sms.rb"

o = Order.new
o.view_menu
o.select_dish("chips", 2)
o.select_dish("chicken chow mein")
o.select_dish("doner kebab", 4)
o.view_basket
o.total
o.place_order(17.60)
# should place order and send text
o.place_order(5)
# should return an error saying you have miscalculated the total
