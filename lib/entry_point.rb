require_relative 'menu'
require_relative 'order'
require_relative 'bill'

def take_order
    menu = Menu.new
    order = Order.new(menu)
    puts "Kindly provide your ten digit mobile number:"
    @ten_digit_mobile_number = $stdin.gets.chomp
    order.send_the_delivery_notification(customer_phone_number)
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
    bill.generate_bill

  end

  def customer_phone_number
    country_code = "+44"
    mobile_number_with_country_code = country_code + @ten_digit_mobile_number
  end