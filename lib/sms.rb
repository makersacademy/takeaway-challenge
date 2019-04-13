
require 'twilio-ruby'
require 'dotenv'
require_relative 'order'
require_relative 'menu'

class Sms

  def send_text
    order = Order.new
      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      message = "Thank you for your order"
      client.messages.create(

      from: ENV['TWILIO_PHONE'],
      to: ENV['TWILIO_DESTINATION_PHONE'],
      body: message
      )
  end
end
