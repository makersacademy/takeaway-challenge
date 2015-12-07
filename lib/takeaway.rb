require 'dotenv'
require 'rubygems'
require 'twilio-ruby'

class Takeaway
  attr_reader :order_klass, :order, :order_time, :menu, :credentials

  def initialize(order_klass, menu_klass)
    @order_klass = order_klass
    @order = nil
    @menu = menu_klass
    @credentials = Dotenv.load
  end

  def create_order(menu_klass)
    @order = order_klass.new(menu)
  end

  def place_order(order, quantity, total, number)
    fail "Wrong total!" if total != self.order.calculate_cost(order)
    @order_time = Time.new + 3600
    send_sms(number)
  end

  private

  def send_sms(number)
    account_sid = credentials["TWILIO_ACCOUNT_SID"]
    auth_token = credentials["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: credentials["TWILIO_SMS_NUMBER"],
      to: number,
      body: "Thank you! Your order was placed and will be delivered before #{order_time.strftime("%H:%M")}"
    )
  end

end
