require_relative './order'
require 'colorize'

puts "\n\nWelcome to Nonna's.
      \nPlease choose your dishes from the menu below\n\n".center(100).colorize(:green)
new_order = Order.new
new_order.view_menu

while true do
  puts  "\nWhat would you like to do?
        \n1. Add to your order
        \n2. View your order
        \n3. See the menu
        \n4. Place your order and get a confirmation text
        \n5. Exit app".center(30).colorize(:green)
  choice = gets.chomp
  case choice
  when "1"
    puts "Please specify a dish and how many you would like (e.g Salami, 3)".colorize(:light_yellow)
    dish = gets.chomp
    split_choice = dish.split(",")

    if Order::ITALIAN.include? split_choice[0] 
      new_order.add_dish(split_choice[0], split_choice[1].to_i)
    else
      puts "We haven't got that on the menu.".colorize(:light_yellow)
    end

  when "2"
    new_order.view_my_order
  when "3"
    new_order.view_menu
  when "4"
    puts "To place your order and recieve a text confirmation press 1
            \nOr to go back press 2".colorize(:light_yellow)
    decision = gets.chomp

    if decision == "1" && new_order.total.zero?
      puts "You need to add some dishes to you order".colorize(:light_yellow)
    elsif decision == "1" && new_order.total != 0
      new_order.send_sms_confirmation
      puts "A confirmation text is on its way to you :)".colorize(:light_yellow)
      exit
    elsif decision == "2"
    else
      puts "That wasn't an option. Try again".colorize(:light_yellow)
    end
  
  when "5"
    exit
  else
    puts "\nChoose an option, 1, 2, 3 or 4".center(50).colorize(:light_yellow)
  end
end
