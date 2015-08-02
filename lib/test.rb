require 'rubygems'
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC2f4d6a3fb2fcdd3e058b6930b7f47697'
auth_token = '18a596c4b02371cb565004ab54694bcf'
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
    :to => "+447500949050",     # Replace with your phone number
    :from => '+441767512044')   # Replace with your Twilio number
puts message.sid
