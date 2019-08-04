require 'twilio-ruby'
require_relative 'auth_tokens'

class TwilioAPI
  def send(delivery_confirmed)
    account_sid = TWILIO_ACCOUNT_SID
    auth_token = AUTH_TOKEN

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: delivery_confirmed,
        to: PERSONAL_PHONE_NUMBER,
        from: TWILIO_NUMBER)

    puts message.sid
  end
end
