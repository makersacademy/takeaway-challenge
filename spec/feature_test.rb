require_relative '../lib/menu'
require_relative '../lib/order'

puts "--- TEST - Menu has a pizza, puts the price of 7 ---"
my_menu = Menu.new
p my_menu.menu[:pizza]
puts "------TEST OVER-------"

puts "--- TEST - See the list of dishes with prices ---"
my_menu = Menu.new
my_menu.show_menu
puts "------TEST OVER-------"

puts "--- TEST - Add a pizza to the order, puts the order ---"
my_order = Order.new
my_order.add_item(:pizza)
p my_order.total_order
puts "------TEST OVER-------"

puts "--- TEST - Order 1 pizza and 3 kebabs, check total cost of order ---"
my_order = Order.new
my_order.add_item(:pizza)
my_order.add_item(:kebab, 3)
p my_order.total_cost
puts "------TEST OVER-------"
