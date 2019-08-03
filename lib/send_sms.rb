require 'twilio-ruby'

account_sid = 'ACc347dbc5653b93ca05eca5ce0812f2dc'
auth_token = '2b926f00562bb4a77c29fa76c274b6b9'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441527962031' # Your Twilio number
to = '+447831800300' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
