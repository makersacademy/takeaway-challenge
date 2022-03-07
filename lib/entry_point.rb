require_relative 'menu'
require_relative 'order'
require_relative 'bill'
require_relative 'twilio'

def take_order
  menu = Menu.new
  order = Order.new(menu)
  puts "Kindly provide your ten digit mobile number:"
  ten_digit_mobile_number = $stdin.gets.chomp
  puts "Enter 'done' to end the order input"
  run_loop(menu, order)
  bill = Bill.new(order, menu)
  puts bill.generate_bill
  continue_with_the_order?(ten_digit_mobile_number)
end

def run_loop(menu, order)
  loop do
    menu.display_menu_card
    puts "Enter dish number"
    dish = $stdin.gets.chomp
    break if dish == "done"
    puts "Enter the quantity"
    quantity = $stdin.gets.chomp.to_i
    order.add_order(dish, quantity)
  end

end

def continue_with_the_order?(ten_digit_mobile_number)
  puts "Do you want to continue with your order?"
  input = $stdin.gets.chomp
  if input == "yes"
    puts "Your order has been accepted"
    TwilioClient.send_message("+44" + ten_digit_mobile_number) # uncomment tomorrow
  else
    puts "Your order was not placed. See you soon!"
  end
end
