require 'twilio-ruby'

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]
client = Twilio::REST::Client.new(account_sid, auth_token)

from = ENV["TWILIO_NUMBER"] # Your Twilio number
to = ENV["MY_NUMBER"] # Your mobile phone number

space = " " if (Time.now + 3600).hour >= 10
time = (Time.now + 3600).strftime("%k:%M")

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before#{space}#{time}"
)
