# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'ACb577cd2d19e591b5d4a8c72ccacb32d0'
auth_token = '0255773cb752e5fe214b4ab71c87031f'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447723443260' # Your Twilio number
to = '+447985591377' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you for your order: £#{order_total}.
Your food will arrive at 18:30."
)
