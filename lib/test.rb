require 'twilio-ruby'

account_sid = 'AC38aa7338da4e0b2cf1eb0eaf926f6a61'
auth_token = 'a9b4d386b9c648237a180c9db9325292'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447887988288' # Your Twilio number
to = '+447887988288' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
