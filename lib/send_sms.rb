# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'ACeb57b6f70b6a75bc1ac05158bdd48d9c'
auth_token = '7ee9c4f33eb81eebb4a9d5ca708d0992'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447782338793' # Your Twilio number
to = '+447708915623' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
