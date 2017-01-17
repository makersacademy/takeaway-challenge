require 'twilio-ruby'
require_relative 'credentials'

class Messenger

  def send_message(text)
    client = Twilio::REST::Client.new(
      Credentials::ACCOUNT_SID,
      Credentials::AUTH_TOKEN
    )

    client.messages.create(
      to: Credentials::CLIENT_PHONE_NUMBER,
      from: Credentials::TWILIO_PHONE_NUMBER,
      body: text
    )
  end
end
