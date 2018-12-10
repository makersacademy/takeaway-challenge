# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'ACf70029a9f0c4822c0f6a48db855940b5'
auth_token = '64630eee72fe6ba54e2eb6bb79acc8e4'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447481338669 ' # Your Twilio number
to = '+447794814979' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before 18:52""
)