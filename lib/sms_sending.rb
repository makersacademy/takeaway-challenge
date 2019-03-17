# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = ''
auth_token = ''
client = Twilio::REST::Client.new(account_sid, auth_token)

from =  # Your Twilio number
to =  # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Test from mini beasty. Success!"
)
