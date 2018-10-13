require_relative "takeaway.rb"
require_relative "order.rb"
require_relative "messaging.rb"
puts "\n===============================\n"
puts "Welcome to the Jolly Chip Shop.\n"
puts "===============================\n"
puts "Take a look at our menu\n\n"

takeaway = Takeaway.new
puts takeaway.menu
puts ""
puts "What would you like to order?"
puts "Enter the item name exactly as it is in the menu"
loop do
  item = gets.chomp
  break if item == "N"
  puts "how many? (only enter whole numbers)"
  quantity = gets.chomp
  takeaway.add(item, quantity.to_i)
  puts "Anything else? Enter N if nothing else"
end
puts "===============================\n\n"
puts takeaway.print_basket
puts "===============================\n"
puts "Would you like to place this order? (Y or N)"
submit_order = gets.chomp
puts "===============================\n"
if submit_order == "Y"
  takeaway.submit_order
  puts "Thank you! Your order was placed and will "\
  "be delivered before #{(Time.new + 3600).strftime('%H:%M')}"
  puts "You will receive a text message shortly"
  puts "We hope you enjoy your food"
else
  puts "OK, come back later. Bye!"
end
puts "===============================\n"
