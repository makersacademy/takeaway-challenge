require 'rubygems' 
require 'twilio-ruby' 
 
account_sid = 'AC1561c6a6b3e58a8ea5dceafae457ab66' 
auth_token = '69e21a35a0ea8476cc5cafc7c60795aa' 
@client = Twilio::REST::Client.new(account_sid, auth_token) 
 

from = '+447897024994' # Your Twilio number
to = '+447783060017' # Your mobile phone number

message = @client.messages.create(     
                             from: from,
                             to: to,
                             body: "Thank you. Your order was placed and will be delivered before",
                           ) 
 
puts message.sid
