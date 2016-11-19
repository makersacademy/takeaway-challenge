require_relative 'order.rb'
require_relative 'sms.rb'
require 'dotenv'
Dotenv.load

class Takeaway

attr_reader :order

  def initialize
    @sms = Sms.new
    @order = Order.new
  end

  def place_order(customer_order)
      @order.place_order(customer_order)
      send_sms(@order.sms_message)
  end

private

  def send_sms(message)
    @sms.send_message(message)
  end

end
