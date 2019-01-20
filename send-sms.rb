# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC08196a18dcd6a00b48a124bde35a2f4d'
auth_token = '9d9889aebdc3e72ee438d90228d31525'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441242305335' # Your Twilio number
to = 'xx' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
