# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

no more
client = Twilio::REST::Client.new(account_sid, auth_token)

no phone numbers

client.messages.create(
from: from,
to: to,
body: "hello testing 123")
