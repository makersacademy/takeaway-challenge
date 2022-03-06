require_relative 'menu'
require_relative 'order'

def take_order(menu_instance, order_instance)
    @menu = menu_instance
    @order = order_instance
    puts "Kindly provide your ten digit mobile number:"
    @ten_digit_mobile_number = $stdin.gets.chomp
    @order.send_the_delivery_notification(customer_phone_number)
    puts "Enter checkout to end the order input"
    loop do
      @menu.display_menu_card
      puts "Enter dish number"
      @dish = $stdin.gets.chomp
      break if @dish == "checkout"
      puts "Enter the quantity"
      @quantity = $stdin.gets.chomp.to_i
      @order.add_order(@dish, @quantity)
    end

  end

  def customer_phone_number
    country_code = "+44"
    mobile_number_with_country_code = country_code + @ten_digit_mobile_number
  end