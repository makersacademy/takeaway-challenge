require 'twilio-ruby'
require_relative 'secrets'

module Twilio
  def text(number)
    time = (Time.now + 3600).strftime("%H:%M")
    account_sid = Secrets::ACCOUNT_SID
    auth_token = Secrets::AUTH_TOKEN
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{time}.",
      to: number,
      from: Secrets::TWILIO_NUMBER)
  end
end
