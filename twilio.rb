require 'rubygems' 
require 'twilio-ruby' 
 
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN'] 
@client = Twilio::REST::Client.new(account_sid, auth_token) 

time = (Time.now + 3600).strftime("%k:%M")
body = "Thank you! Your order was placed and will be delivered before #{time}"

message = @client.messages.create(   
                             messaging_service_sid: ENV['TWILIO_MESSAGING_SERVICE_SID'],      
                             to: ENV['MYNUM'],
                             body: body
                           ) 
 
puts message.sid
