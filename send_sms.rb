# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
require './lib/takeaway'

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
account_sid = 'AC1a00f110038e27f3193807da229ef5e6'
auth_token = '7ae0ea7743817d43cfff14c011d226db'
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: "Thank you! Your order was placed and will be delivered before #{time45.strftime("%I:%M %p").to_i + 2700}",
     from: '+12562875591',
     to: '+447532669369'
   )

puts message.sid