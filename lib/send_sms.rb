require 'twilio-ruby'

account_sid = 'xxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyy'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+15551234567' # Your Twilio number
to = '+15555555555' # Your mobile phone number

client.account.messages.create(
from: from,
to: to,
body: "Hey friend!"
)