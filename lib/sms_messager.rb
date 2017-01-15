require_relative "twilio_client.rb"

class SMSMessager

  attr_reader :client

  def initialize(twilio_client_class)
    @client = (twilio_client_class || TwilioClient).new.client
  end

  def message(message)
    client.messages.create(
      from: '+441133206073',
      to: '07934024245',
      body: message
    )
  end

end
