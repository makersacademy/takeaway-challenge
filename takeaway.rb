require "./lib/dish.rb"
require "./lib/menu.rb"
require "./lib/sms.rb"
require "./lib/order.rb"
require 'dotenv'

Dotenv.load
divider = ("-" * 60) + "\n"

def show_main_menu(divider)
  puts divider
  puts "Enter 1, 2 or 3 to Select an Option:"
  puts "Enter 'exit' to quit"
  puts ""
  puts "1. Choose food from our menu"
  puts "2. Show the basket"
  puts "3. Checkout"
  puts ""
  puts divider
end

credentials = {
  "sid" => ENV['TWILIO_SID'],
  "auth_token" => ENV['TWILIO_TOKEN'],
  "number" => ENV['TWILIO_NUM']
}

credentials["sid"]

dishes = {
  "rice": 2.99,
  "chicken": 3.99,
  "beef": 3.99,
  "pork": 4.99,
  "vegetables": 1.99
}

menu = Menu.new

dishes.each { |name, price|
  dish = Dish.new(name, price)
  menu.add(dish)
}

sms = SMS.new(credentials)
order = Order.new(menu)

puts divider
puts "Welcome to Simple Food!"
puts "Make an order and you will receive a confirmation text!"

while true
  show_main_menu(divider)
  input = gets.chomp.downcase

  case input

  when "exit"
    break
  when "1"
    
    puts ""
    puts divider
    puts "To add a dish to the order, just type in its name! Type in 'back' to go back!"
    menu.show_dishes
    puts ""
    puts divider


    while true
      selection = gets.chomp
      
      if selection == "back"
        break

      else
        begin
          order.add(selection.to_sym)
          puts  "#{selection} has been added to the basket. 
                The price so far is £#{order.calculate_total}"

        rescue StandardError => e
          puts "Sorry, the selected item does not exist on the menu!"
        end
      end
    end

  when "2"

    if order.basket == []
      puts "You have no items in the basket!"
    else
      order.show_basket
      puts "\n"
    end

  when "3"
    if order.basket == []
      puts 
        "You have no items in the basket! 
        Add some dishes to checkout!"
    else
      puts 
        "Thank you for your order! 
        The total price is £#{order.calculate_total}, 
        a confirmation text is being sent to you"

      delivery_time = (Time.now + 3600).strftime("%H:%M")
      body = "Estimated delivery Time: #{delivery_time}"
      sms.send_sms(body, ENV["MY_NUMBER"])
      break
    end
  end
end