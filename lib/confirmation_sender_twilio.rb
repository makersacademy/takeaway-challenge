require 'twilio-ruby'

class ConfirmationSenderTwilio
  # this could have been a module

  ACCOUNT_SID = ENV["TWILIO_ACCOUNT_SID"]
  AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]
  FROM = ENV["TWILIO_FROM"]
  TO = ENV["TWILIO_TO"]

  def initialize(client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN))
    @client = client
  end
  
  def send(message)
    @client.messages.create(
      from: FROM,
      to: TO,
      body: message
      )
  end
end
