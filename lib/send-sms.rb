require 'dotenv'
Dotenv.load('dotenv.env')

require("bundler")
Bundler.require()

account_sid = ENV["ACCOUNT"]
auth_token = ENV["AUTH"]

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.messages.create(
  to: ENV["MY_PHONE_NUMBER"],
  from: ENV["SENDING_PHONE_NUMBER"],
  body: "Thank you! Your order was placed and will be delivered before 18:52"
)
