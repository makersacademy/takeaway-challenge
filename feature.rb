require './lib/menu.rb'
require './lib/order.rb'

dishes = {"pizza":4, "burger":2, "fries":1}

menu = Menu.new

menu.display(dishes)


order = Order.new

order.complete_order
#order.send_sms(+447817019706,"Thank you for your order:20")
