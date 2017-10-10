require './lib/dish'
require './lib/menu'
require './lib/order'
require './lib/restaurant'

menu = Menu.new

restaurant = Restaurant.new
puts restaurant.see_menu

puts restaurant.add_dish_to_orders(1)
# restaurant.add_dish_to_orders(1)
# restaurant.add_dish_to_orders(2)
# restaurant.add_dish_to_orders(3)
#
#
# puts restaurant.order
# puts restaurant.add_order_total
# puts menu.dishes[0]
# puts restaurant.submit_order(1)
# puts restaurant.submit_order(3)
# puts restaurant.submit_order(1)
# puts restaurant.items

# puts restaurant.get_total
# order = Order.new
#
# order.add_dish(menu.dishes[1])
# order.add_dish(menu.dishes[2])
# order.add_dish(menu.dishes[1])
#
# puts order.items

# restaurant.submit_order(order)
# puts order.total
