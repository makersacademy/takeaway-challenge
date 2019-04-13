
require 'twilio-ruby'
require 'dotenv'
require_relative 'order'
require_relative 'menu'

class Sms

  def send_text(order)
    account_sid = 'AC76c14aab19096e38a8a6f8f94e82a8b9'
    auth_token = '8cd904bf9b544d99c3295066a568b694'

    message = "Thank you for your order"
    Twilio::REST::Client.new(account_sid, auth_token).messages.create(

      from: ENV['TWILIO_PHONE'],
      to: ENV['TWILIO_DESTINATION_PHONE'],
      body: message
      )
  end
end
