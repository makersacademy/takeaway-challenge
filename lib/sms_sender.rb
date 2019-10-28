require "twilio.rb"
# The SMSSender class
class SMSSender
  attr_reader :client

  def initialize(args)
    @client = (args[:twilio_client] || TwilioClient).new.client
  end

  def message(message)
    client.messages.create(
      from: ENV['TWILIO_FROM'],
      to: ENV['TWILIO_TO'],
      body: message
    )
  end
end
