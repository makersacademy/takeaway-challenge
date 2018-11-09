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

p "starts a new order"

p menu.new_order

p "orders a banana and three oranges"

p menu.order_dish(1, 1)
p menu.order_dish(3, 3)

p "shows the current order"

menu.recite_order
