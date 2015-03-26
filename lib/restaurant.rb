require 'rubygems'
require 'twilio-ruby'
require_relative 'sms'

class Restaurant
  include Sms

  def take_order(order, payment_received = 0, customer)
    if payment_received != order.total_price
      raise "You haven't paid the correct amount. No takeaway for you."
    else
      send_text_message(customer.phone_number, delivery_time)
    end
  end

  def delivery_time
    delivery_time = Time.now + (60 * 60)
    delivery_time.round(0)
  end
  
end
