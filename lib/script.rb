require_relative 'order.rb'

order = Order.new

def default_text
  puts
  puts "Please Select an Option:"
  puts "1. View Menu"
  puts "2. Place Order"
  puts "3. Review Order"
  puts "4. Check Out"
  puts "5. Reset"
  puts "6. Exit"
  puts
  puts "Select number and press Enter"
end

puts
puts "Welcome to #{order.name}"

user_input = nil

until user_input == "6"
  default_text
  user_input = gets.chomp
  case user_input
  #View Menu
  when "1" then order.listing
  #Place Order
  when "2" then order.place_order
  #Review Order
  when "3" then order.review
  #Check Out
  when "4" then order.check_out
    #Reset
  when "5" then order.clear_log
    #Exit if 6 is pressed
  end
end
