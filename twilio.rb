# Get twilio-ruby from twilio.com/docs/ruby/install         
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACa08e73f4ff7396cdd32929ec64cb9fbf'
auth_token = '{{ ACe1e63e18fe1393cd6a2a911f4bc5de9b }}'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "Your order was placed before" + Time.now + '. It will arrive in an hour. Thank you!',
    :to => "+447597208597",
    :from => "+447597208597",
puts message.to