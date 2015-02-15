require 'rubygems'
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'PNd91272ce3c1dacc2290bc57d67597e9f'
auth_token = ''
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "Hello big boy",
    :to => "+447595593385",     # Replace with your phone number
    :from => "+441412803593")   # Replace with your Twilio number
puts message.sid