require_relative '../lib/menu'

puts "--- TEST - Menu has a pizza, puts the price of 7 ---"
my_menu = Menu.new
p my_menu.menu[:pizza]
puts "------TEST OVER-------"

puts "--- TEST - Add a pizza to the order, return the order ---"
my_order = Order.new
my_order.add_item(:pizza)
p my_order
puts "------TEST OVER-------"
