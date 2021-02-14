require 'rubygems' 
require 'twilio-ruby'
require 'dotenv/load'

account_sid = TWILIO_ACCOUNT_SID 
auth_token = TWILIO_AUTH_TOKEN 
@client = Twilio::REST::Client.new(account_sid, auth_token) 
 
message = @client.messages.create( 
                             body: 'hello',  
                             messaging_service_sid: 'MG101b57a7e36158f025914ed97d206892',      
                             to: '+447809651034' 
                           ) 
 
puts message.sid