require_relative '../lib/menu.rb'
require_relative '../lib/order.rb'
require_relative '../lib/submit_order.rb'

# Create the objects
menu = Menu.new
order = Order.new
submit_order = SubmitOrder.new(SendMessage, true)

# Add the dishes
number_of_dishes = 5
dish_names = ['Dish one', 'Dish two', 'Dish three', 'Dish four', 'Dish five']
dish_prices = [4, 5, 6, 10, 6]
number_of_dishes.times { |i| menu.add_dish(dish_names[i], dish_prices[i]) }

# Print the menu to the console
puts '--------------------'
puts 'The menu:'
puts '--------------------'
puts
puts menu.print_dishes
puts

# Add two dishes to the order
order.add_to_basket(menu.dishes[0], 1)
order.add_to_basket(menu.dishes[1], 2)

# Print the order to the console
puts 'The order:'
puts '--------------------'
puts order.print_order
puts

# Submit the order
puts 'Submitted?'
puts '--------------------'
puts submit_order.submit(order.basket)
puts
