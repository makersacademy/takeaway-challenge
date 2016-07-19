require_relative 'restaurant'

puts "Creates a new Restaurant"
puts thai_cottage = Restaurant.new

puts "Shows the menu"
puts thai_cottage.view_menu

puts "Shows the full menu"
puts thai_cottage.menu.create_full_menu

puts "Places an order"
puts thai_cottage.place_order

puts "View order basket"
puts thai_cottage.customer_order

#puts "Returns price of single dish"
#puts thai_cottage.order_value
