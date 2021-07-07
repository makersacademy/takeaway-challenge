require './lib/dish.rb'
require './lib/menu.rb'
require './lib/basket.rb'
require './lib/order_confirmation.rb'

Salad = Dish.new('salad', 5)
Pizza = Dish.new('pizza', 8)
Burger = Dish.new('burger', 14)
Chips = Dish.new('chips', 6)
Ice_Cream = Dish.new('ice cream', 10)
Cake = Dish.new('cake', 12)

KFCODE = [Salad, Pizza, Burger, Chips, Ice_Cream, Cake]
