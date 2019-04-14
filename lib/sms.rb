require 'twilio-ruby'
require 'dotenv'
require_relative 'order'

class Sms

  def send_text
    time = Time.new
    later_time = Time.now + 1 * 60 * 60
    message = "Thank you for your order. It will be delivered at
    #{later_time.hour}:#{time.min}"
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    ).messages.create(
      from: ENV['TWILIO_PHONE'],
      to: ENV['TWILIO_DESTINATION_PHONE'],
      body: message
      )
  end
end
