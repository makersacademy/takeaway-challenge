require './lib/order.rb'
order = Order.new
order.add("Prawn Crackers")
order.add("Dumplings")
order.add("Pepperoni Pizza")
order.remove("Pepperoni Pizza")
order.add("Singapore Noodles")
order.list
order.confirm

require './lib/menu.rb'
menu = Menu.new
menu.select("pizza")



As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

require './lib/menu.rb'
menu = Menu.new
menu.view

-------------------------------------------

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

require './lib/menu.rb'
menu = Menu.new
menu.view
menu.select("pizza")
menu.select("ice cream")

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

require './lib/menu.rb'
menu = Menu.new
menu.view
menu.select("pizza")
menu.select("ice cream")
menu.order.total
