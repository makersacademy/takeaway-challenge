# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['ACe295a56820791917a0ec137ae429017b']
auth_token = ENV['904c3961cb3cefeac5428128d12a55b4']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
     from: '+447859919692',
     to: '+447859919692'
   )

puts message.sid