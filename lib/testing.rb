require './order'
require './menu'
require './receipt_calc'
require './takeaway'
require './send_text'

app_on = true
takeaway = Takeaway.new

while app_on
  puts "\nType 1 to view menu\nType 2 to start order\nType 3 to end order and generate receipt\nType 4 to close app"
  user_input = gets.chomp.to_i
  if user_input == 1
    takeaway.start_order
  end
  if user_input == 2
    puts "Please select a dish:"
    user_input = gets.chomp
    takeaway.add(user_input)
  end
  if user_input == 3
    takeaway.end_order
  end
  if user_input == 4
    puts "Goodbye"
    app_on = false
  # else
  #   puts "Invalid option"
  end
end
