# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC3b0a135bdd3be75f4f2cff78019c202e'
auth_token = '6491f5d84aa60db7b9e5152767905184'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447446889567' # Your Twilio number
to = '+447564186579' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: 'Thank you! Your order was and is on its way!'
)
