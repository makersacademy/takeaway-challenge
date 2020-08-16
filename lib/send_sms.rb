require 'twilio-ruby'

account_sid = 'AC459b142ec5c7b28878a5e6f0c716186c'
auth_token = 'yd9911b57217890bc611c0641195a8cdd'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+420774547370' # Your Twilio number
to = '+420774951492' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)