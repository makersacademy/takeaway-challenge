require 'twilio-ruby'
require 'dotenv/load'
require 'time'

class SendMessage
  def initialize(
      client = Twilio::REST::Client.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN'])
    )
    @client = client
  end

  def send
    @client.messages.create(message_arguments)
    "Message sent"
  end

  private

  def message_arguments
    {
      body: "Thank you for your order. It will be with you before #{time}",
      to: ENV['MY_PHONE_NUMBER'],
      from: ENV['TWILIO_PHONE_NUMBER']
    }
  end

  def time
    time = Time.now + 3600
    "#{time.hour}:#{time.min}"
  end
end
