require 'twilio-ruby'
require 'dotenv/load'

class Message

  def initialize(twilio_client = Twilio::REST::Client.new(ENV['ACC_SID'], ENV['TOKEN']))
    @twilio_client = twilio_client
  end

  def send
    message = @twilio_client.messages.create(
      body: "Your order has been placed!
        It will be with you at: #{(Time.now + 3600).strftime("%H:%M")}",
      to: ENV['TWILIO_TO_NR'],
      from: ENV['TWILIO_FROM_NR'])
    message.error_code.zero?
  end

end
