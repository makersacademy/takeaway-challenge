

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

require './lib/restaurant.rb'
thai_tanic = Restaurant.new
thai_tanic.menu.view

-------------------------------------------

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

require './lib/restaurant.rb'
thai_tanic = Restaurant.new
thai_tanic.menu.view
order_42109 = thai_tanic.new_order
order_42109.add("spring rolls", 2)
order_42109.add("massaman curry", 1)
order_42109.add("pad kee mao", 2)
order_42109.add("sticky rice", 1)

-------------------------------------------

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

require './lib/restaurant.rb'
thai_tanic = Restaurant.new
thai_tanic.menu.view
order_42109 = thai_tanic.new_order
order_42109.add("spring rolls", 2)
order_42109.add("massaman curry", 1)
order_42109.add("pad kee mao", 2)
order_42109.add("sticky rice", 1)
order_42109.check_total

------------------------------------------

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

require './lib/restaurant.rb'
thai_tanic = Restaurant.new
thai_tanic.menu.view
order_42109 = thai_tanic.new_order
order_42109.add("spring rolls", 2)
order_42109.add("massaman curry", 1)
order_42109.add("pad kee mao", 2)
order_42109.add("sticky rice", 1)
order_42109.check_total
thai_tanic.finalise_order(32.10)
