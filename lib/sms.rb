# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require "twilio-ruby"

account_sid = "AC2e188a8f207af19460885e297d38fd5f"
auth_token = "ab7e2ccff7b29f06861bc5ae2af7a902"
client = Twilio::REST::Client.new(account_sid, auth_token)

from = "+15551234567" # Your Twilio number
to = "+4407578084984" # Your mobile phone number

client.messages.create(
  from: from,
  to: to,
  body: "Hey friend!",
)
