require_relative 'menu'
require_relative 'order'
require_relative 'bill'
require_relative 'twilio'

def take_order
    menu = Menu.new
    order = Order.new(menu)
    puts "Kindly provide your ten digit mobile number:"
    ten_digit_mobile_number = $stdin.gets.chomp
    puts "Enter checkout to end the order input"
    loop do
      menu.display_menu_card
      puts "Enter dish number"
      dish = $stdin.gets.chomp
      break if dish == "checkout"
      puts "Enter the quantity"
      quantity = $stdin.gets.chomp.to_i
      order.add_order(dish, quantity)
    end

    bill = Bill.new(order, menu)
    puts bill.generate_bill
    puts "Your order has been accepted"
    TwilioClient.send_message("+44" + ten_digit_mobile_number)

  end
