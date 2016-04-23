require './lib/dish'
require './lib/menu'
require './lib/order'

dish = Dish.new(name: "Pizza", price: 7.99)
menu = Menu.new(dish) 
order = Order.new(menu)

#Scenario 1: print list of dishes with prices
p dish
p menu
# p menu.print_menu.pop.quantity = 4
p dish.args[:name]
p menu.print_menu

#Scenario 2: select dish and quantity
