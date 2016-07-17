require_relative 'restaurant'

puts "Creates a new Restaurant"
puts thai_cottage = Restaurant.new

puts "Shows the menu"
puts thai_cottage.view_menu

puts "Places an order"
puts thai_cottage.place_order

#puts "Places an order"
#puts thai_cottage.order.get_order

puts "Returns price of single dish"
puts thai_cottage.order_value

#puts "Returns price of single dish"
#puts thai_cottage.order.customer_order
