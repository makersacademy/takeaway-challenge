# this file is just helping with the logic for running the program
require './lib/customer'
require './lib/dish'
require './lib/menu'
require './lib/order'
require './lib/send_sms'
require './lib/pub'

cust = Customer.new
cust.look
cust.choice("Burger", 2)
cust.choice("Soup", 3)
cust.choice("Burger")

cust.checkout(43.95)

order = Order.new
order.add("Burger", 2)
order.add("Soup", 3)

pub = Pub.new(order)
pub.read_and_make
