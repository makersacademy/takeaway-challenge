require './docs/order.rb'
require './docs/dish.rb'

dish1 = Dish.new("pizza", 10)
dish2 = Dish.new("spaghetti", 12)
dish3 = Dish.new("garlic bread", 5)
dish4 = Dish.new("salad", 7)

order = Order.new

dish1.quantity(2)
order.add(dish1)
order.add(dish2)
dish3.quantity(2)
order.add(dish3)
order.add(dish4)
