require "./lib/dish.rb"
require "./lib/menu.rb"
require "./lib/sms.rb"
require "./lib/order.rb"

credentials = {
  "sid" => ENV['TWILIO_SID'],
  "auth_token" => ENV['TWILIO_TOKEN'],
  "number" => ENV['TWILIO_NUM']
}

divider =  ("-" * 30) + "\n"

dishes = {
  "rice": 2.99,
  "chicken": 3.99,
  "beef": 3.99,
  "pork": 4.99,
  "vegetables": 1.99
}

menu = Menu.new

dishes.each {|name, price|
  dish = Dish.new(name, price)
  menu.add(dish)
}

sms = SMS.new(credentials)
order = Order.new(menu)

puts divider
puts "Welcome to Simple Food!"
puts "Make an order and you will receive a confirmation text!"
puts divider

while true
  puts "Please select an option"
  puts "1. Show the menu"
  puts "2. Show the basket"
  puts "3. Checkout"
  puts "0. Exit the program"

  input = gets.chomp

  case input
  when "0"
    break
  when "1"
    puts divider
    menu.show_dishes
    puts divider
    puts "To add an option to the order, just type in its name! type in 'back' to go back!"

    while true
      selection = gets.chomp
      if selection == "back"
        break
      else
        begin
          order.add(selection.to_sym)
          puts "#{selection}. added to the basket. The price so far is £#{order.calculate_total}"
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
      puts "You have no items in the basket! Add some dishes to checkout!"
    else
      puts "The total price is £#{order.calculate_total}"
      delivery_time = (Time.now + 3600).strftime("%H:%M")
      body = "Thank you for your order! Estimated delivery Time: #{delivery_time}"
      sms.send_sms(body, ENV["MY_NUMBER"])
      break
    end
  end
end