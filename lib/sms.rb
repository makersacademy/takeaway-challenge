require 'twilio-ruby'
require 'dotenv'

class Sms

  attr_reader :twilio
  def initialize(twilio = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']))# so will default to this if no argument passed
    @twilio = twilio
  end

  def send_text(phone_number)
    time = Time.new
    later_time = Time.now + 1 * 60 * 60
    message = "Thank you for your order. It will be delivered at #{later_time.hour}:#{time.min}"
    @twilio.messages.create({
      from: ENV['TWILIO_PHONE_FROM'],
      to: phone_number,
      body: message
      })
  end
end
