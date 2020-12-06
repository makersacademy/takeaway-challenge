# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require "dotenv/load"
require "rubygems"
require "twilio-ruby"

account_sid = ENV["SID"]
auth_token = ENV["TOKEN"]
@client = Twilio::REST::Client.new(account_sid, auth_token)
time_now = Time.new
message = @client.messages
  .create(
    body: "\nThank you for your order!\nYour total: #{$sum} \nEstimated delivery #{time_now.hour + 1}:#{time_now.min}.",
    from: ENV["FROM"],
    to: ENV["TO"],
  )
