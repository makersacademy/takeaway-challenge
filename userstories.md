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
menu.has_dish?('xyz') == true
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
menu.has_dish?('xyz') == true
order.final_order.include?({Ordered_dish: dish, Quantity: 2}) == true