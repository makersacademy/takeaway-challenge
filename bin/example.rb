
require_relative '../lib/menu.rb'
require_relative '../lib/order.rb'

menu = Menu.new
order = Order.new(menu)

menu.add('pizza',9.99)
menu.add('fish & chips', 12.00)
menu.add('curry', 12.99)
menu.add('sushi', 16.00)

puts "---- The Menu ----"
puts menu.print

order.add('pizza', 1)
order.add('fish & chips',3)
order.add('sushi',2)
order.add('curry', 5)

puts "----Order Summary ----"
puts order.summary

puts "----Total Price ----"
puts order.total_price


order.place_order(142.94)
