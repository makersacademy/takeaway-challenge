require 'twilio-ruby'
require 'Date'
require_relative 'private'

def message
  account_sid = ACCOUNT_SID
  auth_token = AUTH_TOKEN
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = FROM # Your Twilio number
  to = TO # Your mobile phone number
  
  time = (Time.now + 3600).strftime("%H:%M")
  
  client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{time}!"
    )
end
 