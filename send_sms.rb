# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'ACedb6236ce3d2430fc5fe8274639ece3a'
auth_token = 'e859e42a519bf5931ddea8627dc1bcfb'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441274271947' # Your Twilio number
to = '+447504745676' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
