# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC7c12d4befcc01c780756144381883869'
auth_token = '1c399e1dd4435670f79419e51c6e7266'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441290211637' # Your Twilio number
to = '+447748964098' # Your mobile phone number

client.api.account.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
