# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC579e4968fbbdc84cd908d0b213589106'
auth_token = 'a45da61c48a7b9e44cae7851ca460dfa'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+19735595553' # Your Twilio number
to = '+447597870934' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "hello testing 123")