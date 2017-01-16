require 'twilio-ruby'
require_relative 'credentials'

class Messenger

  def send_message(customer_phone_number, text)
    client = Twilio::REST::Client.new(
      Credentials::ACCOUNT_SID,
      Credentials::AUTH_TOKEN
    )

    client.messages.create(
      to: customer_phone_number,
      from: Credentials::PHONE_NUMBER,
      body: text
    )
  end
end
