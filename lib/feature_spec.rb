require_relative 'takeaway'
require_relative 'menu'
require_relative 'dish'
require_relative 'order'

thai_time = Takeaway.new
dish1 = Dish.new(name: "pad thai", price: 5)
dish2 = Dish.new(name: "chicken curry", price: 7)

thai_time.menu.add_dish(dish1)
thai_time.menu.add_dish(dish1)

print thai_time.show_menu
