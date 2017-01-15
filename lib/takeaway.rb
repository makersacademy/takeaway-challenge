require_relative 'order'
require 'dotenv'
Dotenv.load
require 'twilio-ruby'



class Takeaway

  TIME_FORMAT = "%H:%M"

  attr_reader :order, :time

  @time = Time.new

  def initialize(order_session)
    @order = order_session.new(Menu)
    @time = Time.new
  end

  def basket
    self.order.view_order
  end

  def order_total
    self.order.order_sum
  end

  def confirmation_text
    # Your Account SID from www.twilio.com/console
    client = Twilio::REST::Client.new(ENV['Acc_sid'], ENV['auth_token'])
    message = "Thank you! Your order was placed and will be delivered before #{@time}"
    client.message.create(
      from: ENV["Twilio_no"],
      to: ENV["Tel_no"],
      body: message
      )
  end
end
