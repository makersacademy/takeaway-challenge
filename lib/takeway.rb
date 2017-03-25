# program that displays menu of items

require './lib/menu.rb'
require './lib/dish.rb'

list_num = 1

menu = Menu.new
curry = Dish.new("Vindaloo, 8")
pizza = Dish.new("Pepperoni Pizza, 7")
kebab = Dish.new("Doner Kebab, 8")}

menu.add(curry, pizza, kebab)

menu.print 
