# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC54923c376a5518b7cadc4bdbd334423b'
auth_token = '05668900067af1682760d9bdb640abfc'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+17064385262' # Your Twilio number
to = '+447549679737' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you for your order: £20.93"
)
