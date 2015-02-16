require 'rubygems'
require 'twilio-ruby'
 
message = "Another Test message"

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC224c736fce467ca8cf9b8b3bfa73a034'
auth_token = 'b4c6b04027185a9860c8e9b429038012'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => message,
    :to => "+447738567183",     # Replace with your phone number
    :from => "+441315102998")   # Replace with your Twilio number
puts message.sid