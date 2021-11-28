# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'twilio-ruby'

# Class Twilio_SMS

# def initialize
# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
client = Twilio::REST::Client.new(
  ENV['TWILIO_ACCOUNT_SID'],
  ENV['TWILIO_AUTH_TOKEN']
)
# end

client.messages.create(
  from: "[YOUR TWILIO NUMBER]",
  to: "[YOUR CELL PHONE NUMBER]",
  body: "You just sent an SMS from Ruby!"
)

# puts message.sid
# end