# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = '000'
auth_token = '000'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+44000' # Your Twilio number
to = '+44000' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Greetings, comrade!"
)
4