require 'twilio-ruby'
require 'dotenv/load'

class Notification

  def initialize(client = Twilio::REST::Client)
    @new_client = client.new(ENV["TWILIO_ID"], ENV["TWILIO_TOKEN"])
  end

  def send_text(message)
    @new_client.messages.create(
      to: ENV["CUSTOMER_NUMBER"],
      from: ENV["TWILIO_NUMBER"],
      body: message)
  end

end