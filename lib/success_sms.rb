# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'dotenv/load'
require 'twilio-ruby'

puts "enviro vari"
puts $WPDUNK_PHONE

account_sid = '$TWILIO_ACCOUNT_SID'
auth_token = '$TWILIO_AUTH_TOKEN'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '$TWILIO_PHONE' # Your Twilio number
to = '$WPDUNK_PHONE' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: 'Thank you! Your order was and is on its way!'
)
