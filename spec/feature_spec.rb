require './lib/menu.rb'
require "./lib/dish.rb"
require "./lib/order.rb"

menu = Menu.new
puts "Menu Created."

dish1 = Dish.new('Dish 1', 10.00)
puts "Dish created. Name: #{dish1.name} Price: #{dish1.price}"
dish2 = Dish.new('Dish 2', 15.00)
puts "Dish created. Name: #{dish2.name} Price: #{dish2.price}"

menu.add_dish(dish1)
menu.add_dish(dish2)
puts "Dish 1 and 2 added to the menu"

puts "------Show Menu------"
menu.display_dishes


order = Order.new(menu)

puts "Start New Order:"
puts "------Add Seleciton------"
order.add_selection(dish1)
order.add_selection(dish2)
order.add_selection(dish1)
order.add_selection(dish2)

puts "------Checkout------"
order.checkout