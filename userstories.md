<!-- As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices -->

irb
require './lib/menu.rb'
menu = Menu.new
name = 'xyz'
price = 10
menu.add_dish(name, price)
menu.display == [{Name: name, Price: price}]

<!-- As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes -->

irb
require './lib/menu.rb'
require './lib/order.rb'
require './lib/dish.rb'
menu = Menu.new
order = Order.new(menu)
dish = Dish.new("xyz", 10)
menu.add_dish(dish)
menu.display
order.add_order('xyz', 12)
menu.dish?('xyz') == true
<!-- order.final_order.include?(dish) == true -->


<!-- As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order -->

irb
require './lib/menu.rb'
require './lib/order.rb'
require './lib/dish.rb'
menu = Menu.new
order = Order.new(menu)
dish = Dish.new("xyz", 10)
menu.add_dish(dish)
menu.get_dish_obj("xyz") == dish
menu.display
order.add_order('xyz', 2)
menu.dish?('xyz') == true
order.final_order.include?({dish: dish, quantity: 2}) == true
sum = order.final_order[0][:quantity] * order.final_order[0][:dish].price

<!-- As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered -->

irb
require './lib/menu.rb'
require './lib/order.rb'
require './lib/dish.rb'
menu = Menu.new
order = Order.new(menu)
dish1 = Dish.new("xyz", 10)
dish2 = Dish.new("abc", 20)
dish3 = Dish.new("lmn", 30)
menu.add_dish(dish1)
menu.add_dish(dish2)
menu.add_dish(dish3)
menu.get_dish_obj("xyz") == dish1
menu.get_dish_obj("abc") == dish2
menu.get_dish_obj("lmn") == dish3
menu.display
order.add_order('xyz', 3)
order.add_order('abc', 1)
menu.dish?('xyz') == true
menu.dish?('abc') == true
order.final_order
order.final_bill