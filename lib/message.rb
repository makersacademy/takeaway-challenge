require 'rubygems'
require 'twilio-ruby'

class Sms
account_sid = 'AC5eceb31c66b1665714738a0fa1ec0301'
auth_token = '52e5ffba3487fd969503747c4ec1d6c0'

@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.messages.create(
  from: '+447481 340564',
  to: '++44 784164247',
  body: "Thank you! Your order was placed and will be delivered before 18:52"
)
puts message.sid

end
