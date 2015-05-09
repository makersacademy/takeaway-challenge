require 'rubygems'
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACff76451b67216ebbdd338f1506826478'
auth_token = '541ce1558a73c06cdaf46b44709b33f3'
@client = Twilio::REST::Client.new account_sid, auth_token
time = Time.new
time = time + (60 * 60)
time = time.strftime("%H:%M")
message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{time}.",
    :to => "+447864881714",     # Replace with your phone number
    :from => "+441245891171")   # Replace with your Twilio number
puts message.sid