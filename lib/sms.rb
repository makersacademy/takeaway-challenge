
require 'twilio-ruby'
require 'dotenv'
require_relative 'order'

class Sms

  def send_text(order)
    time = Time.new

    message = "Thank you for your order. It will be delivered at #{time.hour} : #{time.min}"
    p message
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).messages.create(

      from: ENV['TWILIO_PHONE'],
      to: ENV['TWILIO_DESTINATION_PHONE'],
      body: message
      )
  end




end
