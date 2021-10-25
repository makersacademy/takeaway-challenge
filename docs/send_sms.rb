# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC7506b34654059c909fc4c34703074ed8'
auth_token = '39d06fb9b3601ae4167f92739d3f9bd8'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+13186665190' # Your Twilio number
to = '+447769214055' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
