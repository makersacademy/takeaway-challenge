require 'twilio-ruby'

account_sid = 'ACaa3e4ba30b28658a9d7b1a051b424a1f'
auth_token = 'f09ba6909500522a26c1fdb6a2d6a823'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441359366051' # Your Twilio number
to = '+447779889503' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
