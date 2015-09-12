require 'rubygems'
require 'twilio-ruby'
require_relative '../.env.rb'
# Get your Account Sid and Auth Token from twilio.com/user/account
ENV[:account_sid]
ENV[:auth_token]
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
    :to => ENV[:phone_number],     # Replace with your phone number
    :from => "+441613751794")   # Replace with your Twilio number
puts message.sid
