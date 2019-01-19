require 'twilio-ruby'

account_sid = 'AC42a31d75e3c4bcf930f9c7494fd8b410'
auth_token = 'f45439aa05314955301fd5855d4825f3'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441329800133' # Your Twilio number
to = '+447985234870' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
