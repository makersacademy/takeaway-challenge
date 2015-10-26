
require './lib/menu'
require './lib/order'
require './lib/order_summary'
require './lib/sms'



# menu = Menu.new
order = Order.new
order.add_item("Pure Beef Hamburger")
order.add_item("Triple-Thick Shakes", 4)
order.summary
order.total_price
order.confirm_order(8) #returns error message: wrong price
order.confirm_order(9) #receives text message


#returns error message: item not on menu
order = Order.new
order.add_item("Chicken & chips")
order.summary
