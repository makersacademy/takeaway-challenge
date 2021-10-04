require 'rubygems' 
require 'twilio-ruby' 
require 'dotenv/load' 
 
account_sid = ENV['TWILIO_ACCOUNT_SID'] 
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token) 
 

from = '+447897024994' # Your Twilio number
to = '+447783060017' # Your mobile phone number

message = @client.messages.create(     
                             from: from,
                             to: to,
                             body: "Thank you. Your order was placed and will be delivered before",
                           ) 
 
puts message.sid
