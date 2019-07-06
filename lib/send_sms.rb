require 'rubygems'
require 'twilio-ruby'
require 'takeaway'

account_sid = 'AC96f984fa56c510ec436528e21b0fd1ab'
auth_token = 'fbb9e24473aa1ac06469ca9e854b279f'
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
 .create(
    body: 'Thank you! Your order was placed and will be delivered before 18:52',
    from: '+441582380213',
    to: '+447932457477'
  )

puts message.sid
