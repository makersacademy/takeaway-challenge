require_relative '../lib/dish.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/restaurant.rb'

salad = Dish.new("Salad", 10)
chicken = Dish.new("Chicken", 13)
fries = Dish.new("Fries", 4)
fish = Dish.new("Fish", 17)

menu = Menu.new([salad, chicken, fries, fish])

restaurant = Restaurant.new(menu)
phone_number = ENV["MY_PHONE"]

# Have a look at the menu:
restaurant.menu.show

# Start a new order with my phone number:
restaurant.new_order(phone_number)

# Add an item to my order:
restaurant.order.items.add(salad, 1)

# Check my order:
puts restaurant.order_summary

# Add 3 items of the same kind to my order:
restaurant.order.items.add(fries, 3)

# Remove one of the previous items:
restaurant.order.items.remove(fries, 1)

# Check my order again:
puts restaurant.order_summary

# Checking out with the correct price:
restaurant.place_order(18) # A text was sent to the number provided earlier.

# The order is now closed:
puts "Checked out? : #{restaurant.order.checked_out?}"
