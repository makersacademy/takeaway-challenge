require_relative './lib/dishes'
require_relative './lib/menu'
require_relative './lib/order' 

chicken = Dish.new("Chicken Pie", 4.50)
beef = Dish.new("Beef & Ale Pie", 5.00)
ham = Dish.new("Ham & Mushroom Pie", 4.00)
vegie = Dish.new("Vegetable Pie", 3.50)
fish = Dish.new("Fish Pie", 5.50)
chips = Dish.new("Chips", 2.00)
mushypeas = Dish.new("Mushy Peas", 1.50)

pieshop = Menu.new("Pie Shop Menu")

pieshop.add_to_menu(chicken)
pieshop.add_to_menu(beef)
pieshop.add_to_menu(ham)
pieshop.add_to_menu(vegie)
pieshop.add_to_menu(fish)
pieshop.add_to_menu(chips)
pieshop.add_to_menu(mushypeas)

pieshop.show_menu

steves_order = Order.new("Stephen Dawes", 07734, pieshop)

steves_order.add_to_order("Chicken Pie", 2)
steves_order.add_to_order("Beef & Ale Pie", 1)
steves_order.add_to_order("Chips", 3)
