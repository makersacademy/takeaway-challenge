require 'twilio.env'
# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
account_sid = TWILIO_ACCOUNT_SID
auth_token = TWILIO_AUTH_TOKEN
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: 'Thank you! Your order was placed and will be delivered before 18:52',
     from: TWILIO_PHONE_NUMBER,
     to: TWILIO_PHONE_TO
   )

puts message.sid
