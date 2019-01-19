require_relative 'menu'
require_relative 'send_sms'
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

  def order(dish, quantity = 1)
    @order.take(dish, quantity)
  end


  def checkout(customer_total)
    prepare_order
    raise 'Halting Order: Unexpected Total' if total != customer_total
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    send_message(message)
    message
  end

  def print_basket
    prepare_order
    output = ""
    alphabetical_order = @prepared_order.sort.to_h
    alphabetical_order.each_pair do |dish, hash|
      output << ", " unless output == ""
      output << "#{dish} x #{hash[:quantity]} (£#{sprintf('%.2f',
                hash[:price] * hash[:quantity])})"
    end
    output << "\nThe total is £#{sprintf('%.2f', total)}"
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