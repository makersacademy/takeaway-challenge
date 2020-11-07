require 'twilio-ruby'
require_relative './apis'
class Message < MyApis

  def send(message)
    account_sid = MyApis::TWILIO_ACCOUNT_SID
    auth_token = MyApis::TWILIO_ACCOUNT_TOKEN
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = MyApis::TWILIO_PHONE_NUMBER # Your Twilio number
    to = MyApis::MY_PHONE_NUMBER # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
