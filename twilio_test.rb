require 'twilio-ruby'
require 'dotenv/load'

# don't hard code my keys
# don't push credentials to GitHub
# set the auth token as an environmental variable and reference the variable from your code

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.messages.create(
    body: "Your order is on its way.",
    to: ENV["MY_PHONE_NUMBER"],
    from: ENV["TWILIO_MAGIC_NUMBER"])
