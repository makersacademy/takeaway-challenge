# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC1fee0d7161fce8e11efc68476c4bf67c'
auth_token = 'd48b5274912f2be52e0e22d616246cf1'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+19035013515' # My Twilio number
to = '+447929875411' # My mobile phone number

client.messages.create(
from: from,
to: to,
body: 'Hungry Man! Thanks so much for your order its on its way!'
)
