require_relative 'menu'
require_relative 'twilio'

class Order

  attr_reader :order_list

  def initialize(menu_instance)
    @menu = menu_instance
    @order_list = {}
  end

  def add_order(dish, quantity)
    single_order = {@menu.menu.keys[dish.to_i - 1] => quantity}
    @order_list.merge!(single_order)
  end

  def order_accepted
    puts "Your order has been accepted"
    TwilioClient.send_message(@mobile_number_to_send_message)
  end

  def send_the_delivery_notification(mobile_number_with_country_code)
    @mobile_number_to_send_message = mobile_number_with_country_code
  end

end