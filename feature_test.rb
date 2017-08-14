require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new

# p menu.dish
#
# p print = menu.dish
#
# p print.has_key?(:curry)
p order1 = Order.new(menu)

p order1.place_order('curry', 5)

p order1.basket

p order1.total

p order1.total_cost
