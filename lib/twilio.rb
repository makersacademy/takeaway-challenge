require 'dotenv'
Dotenv.load
require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

from = ENV['TWILIO_PHONE_NUMBER'] # Your Twilio number
to = ENV['MOBILE'] # Your mobile phone number

client.messages.create(
from: SUBGENIUS CORP,
to: ENV['MOBILE'],
body: "Your order has been received! It will be delivered in 1 hour"
)