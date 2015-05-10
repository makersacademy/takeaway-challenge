require 'rubygems'
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new account_sid, auth_token
time = Time.new
time = time + (60 * 60)
time = time.strftime("%H:%M")
message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{time}.",
    :to => ENV['PHONE_NUMBER'],     # Replace with your phone number
    :from => "+441245891171")   # Replace with your Twilio number
puts message.sid