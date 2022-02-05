require_relative './ubereatz_without_raise_errors'
require 'colorize'

puts "\n\nWelcome to Nonna's. Please choose your dishes from the menu below\n\n".center(20)
the_order = UberEatz.new
the_order.view_menu

  while true do
  puts "\n\n What would you like to do?\n\n1. Add to your order?\n\n2. View your order\n\n3. See the menu\n\n4. Exit app".center(30)
  choice = gets.chomp
    case choice
    when "1"
      puts "Please specify a dish and how many you would like (e.g Salami, 3)"
      dish = gets.chomp
      split_choice = dish.split(",")
      if UberEatz::ITALIAN.include? split_choice[0] 
        the_order.add_dish(split_choice[0], split_choice[1].to_i)
      else
        puts "We haven't got that on the menu"
      end
    when "2"
      the_order.view_my_order
      puts "To place your order and recieve a text confirmation press 1\nOr to go back press 2"
      decision = gets.chomp
      if decision == 1
        the_order.send_SMS_confirmation
        break
      elsif decision == 2
        puts "Please specify a dish and how many you would like (e.g Salami, 3)"
      else
        puts "Choose and option 1 or 2"
        self
      end
    when "3"
      
      the_order.view_menu
    when "4"
      exit
    else
     puts "\nChoose an option, 1, 2, 3 or 4".center(50)
    end
  end


  ITALIAN = {
    "Focaccia" => 4, 'Burrata' => 8, 'Salad' => 5, 'Brusscetta' => 5, 'Salami' => 6,
    'Lasagne' => 5, 'Pizza Margherita' => 10,'Arrabiata' => 10, 'Penne a la Vodka' => 12, 
    'Canelloni' => 15, 'Pumpkin Ravioli' => 12, 'Eggplant Parmigiana' => 13, 'Spaghetti Puttanesca' => 10,
    'Penne Pomodoro' => 9, 'Tiramisu' => 6, 'Afogato' => 7
  }.freeze 