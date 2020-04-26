# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]
client = Twilio::REST::Client.new(account_sid, auth_token)

from = ENV["TWILIO_NUM"] # Your Twilio number
to = ENV["MOBILE_NUM"] # Your mobile phone number

# Set time to 1 hour from now
time = Time.now + 3600
time = time.strftime("%I:%M %p")

client.messages.create(
from: from,
to: to,
body: "This order was placed and will arrive at #{time}"
)
