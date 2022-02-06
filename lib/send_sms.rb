require 'twilio-ruby'

account_sid = 'AC88045c0af6fff272ec6d54df8fc1a561'
auth_token = 'ca2d21e87025ecfaf7cb4cfe8f40e0ce'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+18647345254' # Your Twilio number
to = '+447938120190' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
