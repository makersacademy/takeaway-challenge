
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

