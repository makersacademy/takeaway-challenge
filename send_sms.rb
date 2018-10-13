# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'ACc7885d0faf6d2ee23b548a6a0d68225f'
auth_token = '15c53f5e9cd5be5319c3b6079470c32c'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441727260173' # Your Twilio number
to = '+447598190395' # Your mobile phone number

client.api.account.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before"
)
