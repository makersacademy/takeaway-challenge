require_relative 'order'
require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class Takeaway

  TIME_FORMAT = "%H:%M"

  attr_reader :order

  def initialize(order_klass)
    @order = order_klass.new(Menu)
  end

  def basket_summary
    self.order.display_order
  end

  def order_price
    self.order.order_sum
  end


  def send_text
    client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    time = Time.new + 60*60
    message = "Thanks, your order arrives before #{time}. Your order: #{basket_summary}, You will need to pay: #{order_price}"
    client.messages.create(
      from: ENV['TWILIO_PHONE'],
      to: ENV['MY_PHONE'], 
      body: message
      )
  end
end
