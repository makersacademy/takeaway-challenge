require 'twilio-ruby'

account_sid = 'AC7f2ea5668c8a8fe460313b9bd7e31ee1'
auth_token = '44a3206d789e6bbc7d97fc5e07108d69'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '441293311584' # Your Twilio number
to = '+447462923192' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)