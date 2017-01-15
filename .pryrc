require './lib/restaurant'
require './lib/dish'
require './lib/menu'
require './lib/order'
require_relative 'sms'




moo = Restaurant.new

choripan = Dish.new(:choripan, 5.95)
milanesa = Dish.new(:milanesa, 7.95)
empanada = Dish.new(:empanada, 2.95)
lomito = Dish.new(:lomito, 12.75)

menu1 = Menu.new(choripan, lomito, milanesa, empanada)
menu2 = Menu.new(empanada, milanesa)


order = Order.new(menu1)
