require 'rubygems'
require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}",
     from: ENV["MY_TWILIO_NUMBER"],
     to: ENV["MY_MOBILE_NUMBER"]
   )
