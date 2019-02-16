require './lib/dish.rb'
require './lib/menu.rb'
require './lib/basket_item.rb'
require './lib/basket.rb'

dish = Dish.new("Mydish", 10.00)
menu = Menu.new([dish])
basket = Basket.new
puts menu.dishes
selected_dish = menu.select_dish(dish)
menu.buy(selected_dish, 2)
