require 'dotenv'
Dotenv.load('data.env')
require 'twilio-ruby'

class SMS
  def initialize(client: Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"],
ENV["TWILIO_AUTH_TOKEN"]))
    @client = client
  end

  def confirmation_text(message)
    @client.messages.create(
    from: ENV["TWILIO_PHONE"],
    to: ENV["TWILIO_DESTINATION_PHONE"],
    body: message)
  end
end
