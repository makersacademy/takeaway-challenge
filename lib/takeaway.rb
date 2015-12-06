require 'rubygems'
require 'twilio-ruby'

class Takeaway
  attr_reader :order_klass, :order, :order_time

  def initialize(order_klass)
    @order_klass = order_klass
    @order = nil
  end

  def new_order(menu_klass)
    @order = order_klass.new(menu_klass)
  end

  def place_order(order, quantity, total, number)
    fail "Wrong total!" if total != order.calculate_cost(order)
    @order_time = Time.now + 3600
    send_sms(number)
  end

  private

  def send_sms(number)
    account_sid = 'account_sid'
    auth_token = 'auth_token'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: twilio_number,
      to: number,
      body: "Thank you! Your order was placed and will be delivered before
        #{order_time}"
    )
  end

end
