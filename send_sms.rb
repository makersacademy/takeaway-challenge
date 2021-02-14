require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['ACe9ffca3bc70e808583385be422bad00d']
auth_token = ENV['2d7a027006b32273aa8ab55239c126eb']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
     from: '+15017122661',
     to: '+447736300602'
   )

puts message.sid