require_relative '../lib/menu'
require_relative '../lib/order'

# puts "--- TEST - Menu has a pizza, puts the price of 7 ---"
# my_menu = Menu.new
# p my_menu.menu[:pizza]
# puts "------TEST OVER-------"
#
# puts "--- TEST - See the list of dishes with prices ---"
# my_order = Order.new
# my_order.read_menu
# puts "------TEST OVER-------"
#
# puts "--- TEST - Add a pizza to the order, return message confirming item added ---"
# my_order = Order.new
# my_order.add_item(:pizza)
# puts "------TEST OVER-------"

puts "--- TEST - Order 1 pizza and 3 kebabs, see basket summary and total cost of order (£31) ---"
my_order = Order.new
my_order.add_item(:pizza)
my_order.add_item(:kebab, 3)
my_order.basket_summary
my_order.show_cost
puts "------TEST OVER-------"

puts "--- TEST - Order 3 kebabs, check out and give expected cost ---"
my_order = Order.new
my_order.add_item(:kebab, 3)
# my_order.check_out(24)
puts "------TEST OVER-------"
