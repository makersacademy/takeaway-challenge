# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
account_sid = 'ACb68235a9ab61c4861e4c6bc1464e462a'
auth_token = 'ffd55c0b9c93485e2370a246c8f323e4'
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: 'Hello. This is dog.',
     from: '+12029155104',
     to: '+<my number here>'
   )

puts message.sid
