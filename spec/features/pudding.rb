require './lib/customer.rb'
require './lib/menu.rb'
require './lib/order.rb'
require './lib/texter.rb'

# create menu
menu = Menu.new
menu.add_dish(:pie, 1)
menu.add_dish(:sausage, 2)
menu.add_dish(:mash, 3)

# set up Texter
texter = Texter.new

# Customer
customer = Customer.new(menu, Order.new(texter))
customer.choose(:pie)
customer.choose(:mash)

# place order
customer.place_order(4)
