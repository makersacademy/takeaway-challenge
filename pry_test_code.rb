require './lib/restaurant.rb'
nandos=Restaurant.new
harry=Order.new
john=Order.new
harry.add_item_qty("diet coke", 8)
harry.add_item_qty("caviar", 8)
john.add_item_qty("champagne",1)
harry.checkout_order(799.92)

nandos.accept_order(harry)
# nandos.accept_order(john)
# nandos.basket_summary(harry)
# nandos.confirm_order(harry)
require './lib/restaurant.rb'

harry=Order.new
harry.add_item_qty("diet coke", 8)

harry.checkout(7.92)
