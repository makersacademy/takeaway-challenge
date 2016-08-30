require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class ConfirmationSystem
  attr_reader :msg

  def initialize(client = Twilio::REST::Client.new(ENV['SID'], ENV['TOKEN']))
    @client = client
  end

  def send(message = sms_message)
    @client.messages.create(
    from: ENV['TWILIO'],
    to: ENV['CUSTOMER'],
    body: message)
  end

  def sms_message
    "Thanks for ordering! Your order will arrive before #{delivery_time}"
  end

  def delivery_time
    (Time.new + 60*60).strftime("%H:%M")
  end

end
