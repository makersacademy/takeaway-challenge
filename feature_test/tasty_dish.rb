require_relative "../lib/dish.rb"
tasty_dish = Dish.new("Cake",3.99)
puts "#{tasty_dish.name} costs #{tasty_dish.cost}"
puts "changing cost"
tasty_dish.change_cost(4.99)
puts "#{tasty_dish.name} costs #{tasty_dish.cost}"
