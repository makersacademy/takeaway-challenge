require_relative "twilio_client.rb"

class SMSMessager

  attr_reader :client

  def initialize(args)
    @client = (args[:twilio_client_class] || TwilioClient).new.client
  end

  def message(message)
    client.messages.create(
      from: ENV['TWILIO_FROM'],
      to: ENV['TWILIO_TO'],
      body: message
    )
  end

end
