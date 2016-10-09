require "twilio-ruby"
require_relative "twilio_credentials"

class SmsNotifier

 def send(message)
   account_sid = TwilioCredentials::ACCOUNT_SID
   auth_token = TwilioCredentials::AUTH_TOKEN

   @client = Twilio::REST::Client.new account_sid, auth_token

   response = @client.account.messages.create(
     from: TwilioCredentials::FROM,
     to: TwilioCredentials::TO,
     body: message
   )
 end

end
