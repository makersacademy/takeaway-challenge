
require_relative './dish.rb'
require_relative './menu.rb'
require_relative './order.rb'

menu = Menu.new
order = Order.new

pizza = Dish.new('pizza',9.99)
fish_chips = Dish.new('fish & chips', 12.00)
curry = Dish.new('curry', 12.99)
sushi = Dish.new('sushi', 16.00)

menu.add(pizza)
menu.add(fish_chips)
menu.add(curry)
menu.add(sushi)

puts "---- The Menu ----"
puts menu.print

order.add(pizza, 1)
order.add(fish_chips,3)
order.add(sushi,2)
order.add(curry, 5)

puts "----Order Summary ----"
puts order.summary

puts "----Total Price ----"
puts order.total_price


order.place_order(142.94)
