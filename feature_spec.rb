require './lib/dish'
require './lib/menu'

dish = Dish.new(name: "Pizza", price: 7.99)
menu = Menu.new(dish) 

#Scenario 1: print list of dishes with prices
p dish
p menu
p menu.print_menu