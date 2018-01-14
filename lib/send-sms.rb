# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'rubygems'
require 'twilio-ruby'

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH"]
client = Twilio::REST::Client.new account_sid, auth_token

  client.messages.create(
    from: ENV['MY_PHONE'], # Your Twilio number
    to: ENV['MY_PHONE'],
    body: "Thank you! Your order was placed and will be delivered before 18:52"
  )
