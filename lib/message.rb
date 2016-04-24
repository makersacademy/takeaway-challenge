require 'dotenv'
Dotenv.load

require 'twilio-ruby'

class Message

  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send(message)
    @client.messages.create(
      from: ENV["TWILIO_FROM_PHONE_NUMBER"],
      to: ENV["TWILIO_TO_PHONE_NUMBER"],
      body: message
    )
  end

end