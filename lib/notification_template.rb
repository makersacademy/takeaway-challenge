require 'twilio-ruby'

account_sid = 'xxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'xxxxxxxxxxxxxxxxxxxxxxx'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+111111111111' # Your Twilio number
to = '+111111111111' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
