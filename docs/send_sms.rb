# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC15ecbee19235321da77ab240d55e183b'
auth_token = '6194352224829f0f5aa12dd281f2cda6'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447897034894' # Your Twilio number
to = '+447833297790' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)