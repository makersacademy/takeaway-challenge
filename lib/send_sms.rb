require 'twilio-ruby'

account_sid = 'AC4d6d556e7842f3de32fadf0f3c457055'
auth_token = '5d122b38ff9b0dbe11295882ff839cd3'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441483802708' # Your Twilio number
to = '+447926603924' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
