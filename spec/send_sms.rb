require 'rubygems'
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACabe777749544c0b5fc61f67b5f86cfab'
auth_token = '{{ c5d21ea79dc39d103bb35a29928ddcc3 }}'
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
    :to => "+447834552321",     # Replace with your phone number
    :from => "+44 1572 460311")   # Replace with your Twilio number
puts message.sid
