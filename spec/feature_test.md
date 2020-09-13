

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

require './lib/restaurant.rb'
fat_tonys = Restaurant.new
fat_tonys.menu.view

-------------------------------------------

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

require './lib/restaurant.rb'
fat_tonys = Restaurant.new
fat_tonys.menu.view
takeaway = fat_tonys.new_order
takeaway.add("pizza", 5)
takeaway.("ice cream", 2)

-------------------------------------------

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

require './lib/menu.rb'
menu = Menu.new
menu.view
menu.select("pizza")
menu.select("ice cream")
menu.order.list
menu.order.total

------------------------------------------

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

require './lib/menu.rb'
menu = Menu.new
menu.view
menu.select("pizza")
menu.select("ice cream")
menu.order.list
menu.order.total
menu.order.confirm

require './lib/restaurant.rb'
pizzahut = Restaurant.new
pizzahut.new_order
pizzahut.order.add("pizza")
pizzahut.place_order(6.99)
