require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new
order = Order.new

p menu.print_menu
order.add_items("bruschetta", 2, 4.99)
order.add_items("pizza margherita", 1, 9.99)
p order.basket
@total = order.basket.map { |h| h[:price] }.sum
p @total