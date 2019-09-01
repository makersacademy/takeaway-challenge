require 'twilio-ruby'
require_relative './lib/user_session'

ACCOUNT_SID = 'AC4e2b5a76e4a0b41721f5734e68d3649b'
AUTH_TOKEN = '09c65b7092ebce3118061c297073aa46'
NUMBER = '+447505480464'
client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

from = '+441375352703' # Your Twilio number
to = NUMBER # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%k:%M")}"
)