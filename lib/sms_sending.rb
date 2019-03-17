# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC4941a602f94218710b7b16e514d945e1'
auth_token = 'b47a8f2229c902ffee5ab9f294a0c030'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447449470601' # Your Twilio number
to = '+447891636321' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Test from mini beasty. Success!"
)
