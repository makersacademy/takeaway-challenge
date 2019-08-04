require_relative '../lib/menu.rb'
require_relative '../lib/dish.rb'
# require_relative '../lib/file_handler.rb'
# require_relative '../lib/order.rb'

dish_class = Dish
# file_handler_class = FileHandler
pizza_menu = Menu.new(dish_class)

# pizza_menu.load_menu(file_path)
tasty_dish = Dish.new("a", 5)
tasty_dish_gourmet = Dish.new("a", 6)

pizza_menu.add_menu_item(tasty_dish)
puts pizza_menu.items # show array of dishes
pizza_menu.display

pizza_menu.remove_menu_item(tasty_dish)
puts pizza_menu.items
pizza_menu.display

pizza_menu.add_menu_item(tasty_dish)
pizza_menu.alter_menu_item(tasty_dish_gourmet)
puts pizza_menu.items
pizza_menu.display

# in take away
