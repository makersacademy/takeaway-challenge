require 'rubygems'
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACad8e3f3b988345d3aeb2d6fc315560bb'
auth_token = 'd715fc51512d78c7c62801e71b3d6bf3'
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
    :to => "+447429723584",     # Replace with your phone number
    :from => "+441613751794")   # Replace with your Twilio number
puts message.sid
