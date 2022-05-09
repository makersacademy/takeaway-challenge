# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
#require("bundler")
#Bundler.require()

account_sid = 'AC2d3459615cb8c8436de1fce283fde1d5'
auth_token = 'e52a6f70edac500e87d5fa1f1b8d8fb2'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+14179554815' # Your Twilio number
to = '+44########' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thankyou! Your order was placed and will be delivered 1 hour from now"
)

# put in time 