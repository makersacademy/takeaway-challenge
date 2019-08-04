require_relative "../lib/order.rb"
require_relative "../lib/dish.rb"

order = Order.new

dish1 = Dish.new("Sphagetti", 5)
dish2 = Dish.new("Pasta", 7.9)
dish3 = Dish.new("Puzza", 2.30)
dish4 = Dish.new("Bonbonbonbons", 12.66)
dish5 = Dish.new("Trash", 23.50)

order.add_order_items(dish1, 2)
order.add_order_items(dish2, 3)
order.remove_order_items(dish1, 2)
order.add_order_items(dish1, 1)
order.add_order_items(dish3, 7)
order.add_order_items(dish4, 1)
order.add_order_items(dish5, 8)
order.remove_order_items(dish5, 4)

# p order
order.display
