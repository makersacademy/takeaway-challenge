require './lib/dish.rb'
require './lib/order.rb'
pizza = Dish.new("Pizza", 1.50)
sushi = Dish.new("Sushi", 16.00)

pizza.price
# => 1.50 (bigdecimal)

pizza.to_s
# => "Pizza: £1.50"

pizza.name
#  => "Pizza"

order = Order.new()

order.add(pizza)
# => 1.50 (bigdecimal)
order.add(sushi)
# => 17.50 (bigdecimal)

order.total
# => 17.50 (bigdecimal)

takeaway = takeaway.new()
# (optional list of items, optional order class)

takeaway.dishes
# => Pizza

takeaway.order("Pizza *1, Sushi *2", 33.51)
# => Thank you! Your order was placed and will be delivered before 18:52". You will also receive a text message with these details.


takeaway.order("Pizza *1, Sushi *2", 32.51)
# => raise error "The order total was incorrect"

