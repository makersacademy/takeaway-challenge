# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'time'

# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447401201912' # Your Twilio number
to = ENV['SECRET_MOBILE'] # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you for your order! It will be with you in #{Time.now + 3600}"
)