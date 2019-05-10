# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC27adc241817a450308bb30473d7b7c9d'
auth_token = '6111ec3a27337b1bf661de5c22bb7cd9'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447723442566' # Your Twilio number
to = '+447792442112' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
)
