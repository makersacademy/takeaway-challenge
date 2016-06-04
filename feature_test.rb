require_relative './lib/dishes'
require_relative './lib/menu'

chickenstew = Dish.new("Chicken Stew", 4.50)
beefpie = Dish.new("Beef & Ale Pie", 5.00)
leekpie = Dish.new("Chicken & Leek Pie", 4.00)
vegie = Dish.new("Vegetable Pie", 3.50)
fishpie = Dish.new("Fish Pie", 5.50)
chips = Dish.new("Chips", 2.00)
mushypeas = Dish.new("Mushy Peas", 1.50)

pieshop = Menu.new("Pie Shop Menu")

pieshop.add_to_menu(chickenstew, beefpie, leekpie, vegie, fishpie, chips, mushypeas)
