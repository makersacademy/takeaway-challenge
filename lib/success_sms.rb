# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'dotenv/load'
require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

from = ENV['TWILIO_PHONE'] # Your Twilio number
to = ENV['WPDUNK_PHONE'] # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: 'Thank you! Your order was and is on its way!'
)
