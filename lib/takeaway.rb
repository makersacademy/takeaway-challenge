require_relative 'order'
require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class Takeaway

  TIME_FORMAT = "%H:%M"

  attr_reader :order

  def initialize(order_klass)
    @order = order_klass.new(Menu)
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def basket_summary
    self.order.display_order
  end

  def order_price
    self.order.order_sum
  end


  def send_text
    time = Time.new + 60*60
    message = "Thanks, your order arrives before #{time}. Your order: #{basket_summary}, You will need to pay: #{order_price}"
    @client.account.messages.create({from: TWILIO_PHONE, to: MY_PHONE, body: message})
  end
end
