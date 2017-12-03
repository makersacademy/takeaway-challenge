require './lib/restaurant'

restaurant = Restaurant.new
available_dishes = restaurant.available_dishes
order = Order.new(available_dishes)
p order.add('spaghetti', 5)
p order.add('pizza', 2)
p order.add('meatball', 6)

# puts
#
#p
