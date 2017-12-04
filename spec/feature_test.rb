require './lib/restaurant'

restaurant = Restaurant.new
puts "Restaurant: This is the menu: #{restaurant.print_menu}"

order = restaurant.create_order
puts "My new order has these available dishes #{order.available_dishes}"

order.add('spaghetti', 10)
order.add('meatball', 2)
order.add('pizza', 3)
p order
p restaurant.update_menu

# restaurant.complete_order
# puts restaurant.complete_order
