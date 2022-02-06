require 'twilio-ruby'

account_sid = 'AC9e0eff8296818b4d3561e2d72dded4d7'
auth_token = 'f49fba5afacdf8f9a33d75f92eb17865'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+19125516649' # Your Twilio number
to = '+447824997782' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
