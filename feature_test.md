require './lib/dish.rb'
require './lib/menu.rb'
require './lib/customer.rb'

menu = Menu.new
pepperoni = Dish.new("pepperoni",600)
hotnspicy = Dish.new("hotnspicy", 700)

menu.add(dish)
menu.list
customer = Customer.new
customer.add_to_order(pepperoni, 1)
customer.add_to_order(hotnspicy, 3)
customer.order_total
customer.reciept
