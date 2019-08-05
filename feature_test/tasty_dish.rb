require_relative "../lib/dish.rb"
tasty_dish = Dish.new("Cake", 3.99)
puts "#{tasty_dish.name} costs #{tasty_dish.cost}"
puts "changing cost"

updated_dish = Dish.new("Cake", 4.99)

tasty_dish.alter(updated_dish)
puts "#{tasty_dish.name} costs #{tasty_dish.cost}"
p tasty_dish
p updated_dish
