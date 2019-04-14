require 'dotenv/load'
require 'twilio-ruby'

require_relative 'order'

Dotenv.load('./twilio.env')

class Confirmation
  def send_confirmation(order)
    @order = order
    @time = DateTime.now
    @delivery_time = @time + Rational(1,24)

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = ENV['TWILIO_FROM_NUMBER']# Your Twilio number
    to = ENV['TWILIO_TO_NUMBER'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: <<~SMS
    Thank you for your order.
    Order time:#{@time.hour.to_s}:#{@time.min.to_s}
    Estimated Delivery Time: #{@delivery_time.hour.to_s}:#{@delivery_time.min.to_s}
    SMS
    )
  end
end
