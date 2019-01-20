# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC9e735de55fbe2f8cc2cddb2674bd502e'
auth_token = '576e551d6cf03cf76aec415121e50913'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441599312013' # Your Twilio number
to = '+447964177745' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
