# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

no more
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+19735595553' # Your Twilio number
to = '+447597870934' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "hello testing 123")
