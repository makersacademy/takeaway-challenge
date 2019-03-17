# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'ACbcbe37aae2d391aa7e8dffc070efb5d0'
auth_token = 'f8d8a3938c776b823ef364fd92932063'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447446964753' # Your Twilio number
to = '+447716653251' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Heeeeeeeeeey"
)
