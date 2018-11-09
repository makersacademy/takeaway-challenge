require_relative './../lib/dish'
require_relative './../lib/order'
require_relative './../lib/menu'

menu = Menu.new
banana = Dish.new("Banana", 1)
apple = Dish.new("Apple", 2)
orange = Dish.new("Orange", 3)

puts "adding dishes to menu"

p menu.add_dish(banana)
p menu.add_dish(apple)
p menu.add_dish(orange)

puts "displaying the menu now"

menu.display_menu

p "orders an apple"

p menu.order_dish(2)
