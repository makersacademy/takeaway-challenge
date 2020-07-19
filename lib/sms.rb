require_relative 'order.rb'
require 'dotenv/load'

class Sms

  def send_sms(order = Order.new)

    require 'twilio-ruby'

    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    client.messages.create(
      from: ENV['TWILIO_PHONE'],
      to: ENV['MY_PHONE'],
      body: order.order_message
    )

  end
end
