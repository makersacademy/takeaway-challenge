require 'twilio-ruby'

account_sid = 'AC4e2b5a76e4a0b41721f5734e68d3649b'
auth_token = '09c65b7092ebce3118061c297073aa46'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441375352703' # Your Twilio number
to = '+447505480464' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%k:%M")}"
)