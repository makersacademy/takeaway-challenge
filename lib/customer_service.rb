require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class CustomerService
  def confirmation_text
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to:   ENV['MOBILE_PHONE_NUMBER'],
      body: [
        "Thanks for your order! 🍕 It's being prepared and will",
        " be with you by #{(Time.now + 3600).strftime('%H:%M')}"
      ].join
    )
  end

  private

  attr_reader :client, :client_class

  def initialize(client_class = Twilio)
    @client_class = client_class
    @client = create_client
  end

  def create_client
    client = client_class::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
  end
end
