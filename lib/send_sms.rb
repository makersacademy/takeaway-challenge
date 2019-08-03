require 'twilio-ruby'

account_sid = 'ACc347dbc5653b93ca05eca5ce0816f6dc'
auth_token = '2b926f00566bb4a77c29fa76c674b6b9'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441527962031' # Your Twilio number
to = '+447587367437' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Takeaway Challenge!"
)
