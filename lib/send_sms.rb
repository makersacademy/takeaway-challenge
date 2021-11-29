# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'ACeb57b6f70b6a75bc1ac05158bdd48d9c'
auth_token = '6b657378df120dc9651efafc0372c846'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447782338793' # Your Twilio number
to = '+44' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{Time.now + 1*60*60}!"
)
