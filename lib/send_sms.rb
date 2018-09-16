require 'twilio-ruby'

account_sid = 'AC878acd04f5f48bec769574ff5a0b1e97'
auth_token = '7d2b38d4b879d50c61b3d002614660ab'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447449672445' # Your Twilio number
to = '+447905659510' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
