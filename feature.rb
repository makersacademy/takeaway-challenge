require './lib/takeaway.rb'
require './lib/Menu.rb'

dishes = {"pizza":4, "burger":2, "fries":1}
menu = Menu.new
p menu.print_dish

tw = TakeAway.new(Menu.new)
tw.print_menu
tw.place_order('pizza',3)
p  tw.basket
y = menu.present? 'pizza'

p y

















































require './lib/menu.rb'
require './lib/order.rb'



#order = Order.new

#order.complete_order
#order.send_sms(+447817019706,"Thank you for your order:20")

#order.order("pizza", 4)
#order.order("burger", 4)
#order.order("fries", 4)

#p order.items

