require_relative '../lib/menu.rb'
require_relative '../lib/dish.rb'
require_relative '../lib/file_handler.rb'

dish_class = Dish
file_handler_class = FileHandler
pizza_menu = Menu.new(dish_class, file_handler_class)



pizza_menu.load_menu(file_path)
tasty_dish = Dish.new(name,cost)

pizza_menu.add_item(tasty_dish)

pizza_menu.display


pizza_menu.remove_item(tasty_dish)

pizza_menu.alter_cost(dish,cost)



