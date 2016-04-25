require "twilio-ruby"
require 'dotenv'
Dotenv.load

class Message

  def send
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create(
      from: ENV["TWILIO_FROM_PHONE_NUMBER"],
      to:   ENV["TWILIO_TO_PHONE_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 3600).strftime "%H:%M"}"
      )
  end


end
