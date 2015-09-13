# require 'twilio-ruby'
require_relative '../.env'

# Get your Account Sid and Auth Token from twilio.com/user/account
# account_sid = 'ACe2ed22de6304098e2edb1f47a81b7f16'
# auth_token = '{{ 7ebd86364d5152c6f45750eaffdeea7f }}'
@client = Twilio::REST::Client.new ENV[:account_sid], ENV[:auth_token]

message = @client.account.messages.create(:body => "Your takeway will arrive in 10 minutes",
    :to => "+07962107779",     # Replace with your phone number
    :from => "+441604280198")   # Replace with your Twilio number
puts message.sid
