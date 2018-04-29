require 'twilio-ruby'
require 'dotenv/load'
require 'time'

class SendMessage
  def initialize(test = false)
    @test = test
    @client = Twilio::REST::Client.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN'])
    @text_message = "Thank you for your order. It will be with you before #{time}"
  end

  def send
    return "Message sent" if @test

    message = @client.messages.create(
      body: @text_message,
      to: ENV['MY_PHONE_NUMBER'],
      from: ENV['TWILIO_PHONE_NUMBER']
    )
    message.sid

    "Message sent"
  end

  private

  def time
    time = Time.now + 3600
    "#{time.hour}:#{time.min}"
  end
end
