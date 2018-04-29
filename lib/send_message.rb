require 'twilio-ruby'
require 'dotenv/load'

class SendMessage
  def initialize(test = false)
    @test = test
    @client = Twilio::REST::Client.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN'])
  end

  def send(text_message)
    return "Message sent" if @test

    message = @client.messages.create(
      body: text_message,
      to: ENV['MY_PHONE_NUMBER'],
      from: ENV['TWILIO_PHONE_NUMBER']
    )
    message.sid

    "Message sent"
  end
end
