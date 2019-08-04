require 'twilio-ruby'
require_relative 'auth_tokens'


class TwilioAPI
  def send(delivery_confirmed)
    account_sid = TWILIO_ACCOUNT_SID # Your Account SID from www.twilio.com/console
    auth_token = AUTH_TOKEN   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: delivery_confirmed,
        to: PERSONAL_PHONE_NUMBER,    # Replace with your phone number
        from: TWILIO_NUMBER)  # Replace with your Twilio number

    puts message.sid
  end
end