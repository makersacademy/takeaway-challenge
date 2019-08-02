require_relative '../lib/menu.rb'
require_relative '../lib/dish.rb'
# require_relative '../lib/file_handler.rb'
# require_relative '../lib/order.rb'

dish_class = Dish
# file_handler_class = FileHandler
pizza_menu = Menu.new(dish_class)


# pizza_menu.load_menu(file_path)
tasty_dish = Dish.new("asd",5)

pizza_menu.add_item(tasty_dish)

pizza_menu.items # show array of dishes

pizza_menu.display


pizza_menu.remove_item(tasty_dish)

pizza_menu.alter_item(dish)



# in take away

