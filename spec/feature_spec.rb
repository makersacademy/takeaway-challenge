require './lib/restaurant'
require './lib/message_confirmation'


menu = [
  { name: "spaghetti", price: 1, quantity: 8 },
  { name: "meatball", price: 10, quantity: 9 },
  { name: "pizza", price: 5, quantity: 10 }
]

restaurant = Restaurant.new(menu)
puts "Restaurant: This is the menu: #{restaurant.menu}"

order = restaurant.create_order
puts "My new order has these available dishes #{order.available_dishes}"


order.add('spaghetti', 1)
order.add('meatball', 2)
order.add('pizza', 3)

# restaurant.complete_order
puts order.check_sum_items
