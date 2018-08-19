require "dotenv/load"
require "twilio-ruby"

class Messager
  def self.send_text(text_message)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    twilio_phone = ENV["TWILIO_PHONE_NUMBER"]
    customer_phone = ENV["CUSTOMER_PHONE_NUMBER"]
    client = Twilio::REST::Client.new account_sid, auth_token

    client.api.account.messages.create(
     from: twilio_phone,
     to: customer_phone,
     body: text_message
    )
  end
end
