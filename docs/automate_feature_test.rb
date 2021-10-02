require './lib/menu'
require './lib/dish'

d1 = Dish.new("Chicken Korma", 8.99)
d2 = Dish.new("Pilau Rice", 2.99)
d3 = Dish.new("Peshwari Naan", 1.99)
d4 = Dish.new("4 Poppadoms", 1.99)
d5 = Dish.new("Stella Artois", 3.99)

menu = Menu.new

menu.add_dish(d1)
menu.add_dish(d2)
menu.add_dish(d3)
menu.add_dish(d4)
menu.add_dish(d5)
