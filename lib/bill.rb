require_relative 'menu'
require_relative 'order'
require_relative 'twilio'

class Bill
  
  attr_reader :my_number

  def initialize(order_instance, menu_instance)
    @menu = menu_instance
    @order = order_instance
    @my_number = ""
  end

  def display_bill
    @order.order_list.each do |k, v|
      puts "#{k} --> #{v} * #{@menu.menu[k]}"
    end
    puts "-----------------------------------"
    puts "total = #{total_amount}"
  end

  def customer_phone_number
    puts "Enter your phone number for the notifications:"
    customer_number = "740*******"
    country_code = "+44"
    @my_number = country_code + customer_number
  end

  def total_amount
    total = 0
    @order.order_list.each do |k, v|
      total += @menu.menu[k] * v
    end

    return total

  end

  def order_accepted
    TwilioClient.send_message
  end

end