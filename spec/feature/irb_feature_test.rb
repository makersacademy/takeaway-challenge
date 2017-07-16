require './lib/dish.rb'
require './lib/order.rb'
require './lib/restaurant.rb'
require './lib/menu.rb'

d1 = Dish.new("Burrito", 5)
d2 = Dish.new("Pizza", 10)
d3 = Dish.new("Burger", 15)
unserved_dish = Dish.new("FREE HAGGIS", 0)
dish_list = [d1, d2, d3]

r = Restaurant.new(Menu.new(dish_list))
r.show_menu

good_order = Order.new(r.menu)
good_order.add_dish_to_order(d1,1)
puts
puts good_order.calculate_cost
