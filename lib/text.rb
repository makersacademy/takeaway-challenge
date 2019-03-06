require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load ('./twilio_sms.env')

class Text

  # Your Account Sid and Auth Token from twilio.com/console
  account_sid = ENV['account_sid']
  auth_token = ENV['auth_token']
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  @time = (Time.new + 30*60).strftime("at %I:%M%p") # 30 minutes from checkout

  message = @client.messages
    .create(
       body: "Thank you! Your order was placed and will be delivered " + @time,
       from: ENV['twilio_num'],
       to: ENV['my_num']
     )

  puts message.sid

end
