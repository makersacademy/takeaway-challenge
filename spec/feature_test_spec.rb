require './lib/dish'
require './lib/menu'
require './lib/order'
require './lib/restaurant'

menu = Menu.new

restaurant = Restaurant.new(menu)
menu.load_menu_from_file
puts restaurant.see_menu

# puts menu.dishes[0]
# puts restaurant.submit_order(1)
# puts restaurant.submit_order(3)
# puts restaurant.submit_order(1)
# puts restaurant.items

# puts restaurant.get_total
order = Order.new

order.add_dish(menu.dishes[1])
order.add_dish(menu.dishes[2])
order.add_dish(menu.dishes[1])

puts order.items

# restaurant.submit_order(order)
# puts order.total
