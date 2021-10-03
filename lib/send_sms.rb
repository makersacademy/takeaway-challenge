# Download the helper library from https://www.twilio.com/docs/ruby/install
require "rubygems"
require "twilio-ruby"
require "envyable"

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages.create(
  body: "Thank you! Your order was placed and will be delivered before 18:52",
  from: "+447897030605",
  to: ENV["MY_NUMBER"],
)

puts message.sid
