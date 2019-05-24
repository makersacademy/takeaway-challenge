# this file is just helping with the logic for running the program
require './lib/customer'
require './lib/dish'
require './lib/menu'
require './lib/order'
require './lib/send_sms'

cust = Customer.new
cust.look
cust.choice("Burger",2)
cust.choice("Soup", 3)
# cust.choice("Burger")

cust.checkout(43.95)


o = Order.new

