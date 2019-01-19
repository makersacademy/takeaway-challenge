require_relative 'menu'
require_relative 'send_sms'
require_relative 'order'
require 'dotenv/load'

class Takeaway

  def initialize(args)
    @menu = args[:menu] || Menu.new
    @messenger = args[:twilio] || SendSms.new
    @order = args[:order] || Order.new(@menu)
  end

  def menu
    @menu.list
  end

  def take_order(dish, quantity = 1)
    @order.take(dish, quantity)
  end


  def checkout(customer_total)
    raise 'Halting Order: Unexpected Total' if @order.total != customer_total
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    send_message(message)
    message
  end

  def print_basket
    output = ""
    @order.basket.each_pair do |dish, hash|
      output << ", " unless output == ""
      output << "#{dish} x #{hash[:quantity]} (£#{sprintf('%.2f',
                hash[:price] * hash[:quantity])})"
    end
    output << "\nThe total is £#{sprintf('%.2f', @order.total)}"
  end

  private

  def delivery_time
    one_hour = 3600
    current_time = Time.now + one_hour
    current_time.strftime('%H:%M')
  end

  def send_message(text)
    @messenger.create_message(text)
  end

end