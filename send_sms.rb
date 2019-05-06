

require 'twilio-ruby'

account_sid = 'AC0e75a2ce960a147929fea188f19f5e6b'
auth_token = 'y9930b833590bf565df06588abbcc3670'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+15551234567' # Your Twilio number
to = '+4407495029101' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)