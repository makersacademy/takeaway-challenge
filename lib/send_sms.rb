# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'time'
require_relative 'private'

def confirmation_text
  account_sid = ACC_SID
  auth_token = AUTH_TOKEN
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = FROM # Your Twilio number
  to = TO # Your mobile phone number

  delivery_time = (Time.now + 1800).strftime("%H:%M")

  client.messages.create(
  from: from,
  to: to,
  body: "Thank you for ordering from the best Italian at Makers. We estimate your order will arrive before #{delivery_time}!"
  )
end