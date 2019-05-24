require './lib/customer'
require './lib/dish'
require './lib/menu'
require './lib/order'

cust = Customer.new
cust.look
cust.choice("Burger",2)
cust.choice("Soup", 3)
#cust.choice("Burger")


o = Order.new
o.get_the_cost_from_menu("Burger")
