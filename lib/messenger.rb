require 'rubygems' 
require 'twilio-ruby' 

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]
@client = Twilio::REST::Client.new(account_sid, auth_token) 

a = Time.now + 1*60*60
hour_later = a.strftime("%I:%M %p, %d %B, %Y")

message = @client.messages.create( 
                             body: "Thank you! Your order was placed and will be delivered before #{hour_later}",  
                             messaging_service_sid: 'MG2550f3635b0fac607532e4b4c41cff5a',      
                             to: ENV['MY_PHONE'] 
                           ) 
 
puts message.sid