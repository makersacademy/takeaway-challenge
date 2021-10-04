require "twilio-ruby"
# Disclaimer: Makers examplar code used as template for construction

class Confirmation
  attr_accessor :delivery_time

  def initialize(credentials, client: nil)
    @delivery_time = (Time.now + 3600).strftime("%I:%M %p")
    @client = client || Twilio::REST::Client.new(credentials[account_sid], credentials[auth_token])
    @credentials = credentials
  end

  def text
    "Thank you! Your order was placed and will be delivered before #{@delivery_time}"
  end

  def create_message
    client.messages.create(message_details)
  end

  private

  attr_reader :client, :credentials

  def message_details
    {
      to: credentials[:to],
      from: credentials[:from],
      body: credentials[:body],
    }
  end
end
