require 'rubygems'
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "test",
    :to => "+447733080200",     # Replace with your phone number
    :from => "+44 1243 689132")   # Replace with your Twilio number
puts message.sid