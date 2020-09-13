require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Message

  def initialize(time: Time.new)
    @time = time
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])

  end

  def send_sms
    @client.messages.create(
      from: ENV['TWILIO_NUM'],
      to: ENV['MY_NUM'],
      body: customer_message)
  end
private

  def customer_message
    "Order placed. It will be with you by #{(@time + 60 * 60).strftime("%I:%M %p")}"
  end
end
