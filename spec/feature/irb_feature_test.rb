require './lib/dish.rb'
require './lib/order.rb'
require './lib/restaurant.rb'
require './lib/menu.rb'
require './lib/messager.rb'


d1 = Dish.new("Burrito", 5)
d2 = Dish.new("Pizza", 10)
d3 = Dish.new("Burger", 15)
unserved_dish = Dish.new("FREE HAGGIS", 0)
dish_list = [d1, d2, d3]

r = Restaurant.new(Menu.new(dish_list),Messager.new(config))
r.show_menu

bad_order = Order.new(r.menu)
bad_order.add_dish_to_order(unserved_dish,1)

good_order = Order.new(r.menu)
good_order.add_dish_to_order(d1,1)
puts
puts good_order.calculate_cost

r.take_order(good_order, 4)
