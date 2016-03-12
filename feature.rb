require_relative './lib/menu.rb'
require_relative './lib/dish.rb'

menu  = Menu.new(Dish)

menu.create_dish(:tuna_paste, 4.33)

menu.see_dishes


