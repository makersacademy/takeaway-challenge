require 'rubygems'
require 'twilio-ruby'

account_sid = 'AC8a40b1c2bad00ceecb1d7a5bf1008585'
auth_token = 'c5d152e998e2487fa5769c9f5d03dd82'
@client = Twilio::REST::Client.new(account_sid, auth_token)
 
a = Time.now + 1 * 60 * 60
hour_later = a.strftime("%I:%M %p, %d %B, %Y")

message = @client.messages.create( 
    body: "Thank you! Your order was placed and will be arrive on or before #{hour_later}!",  
    messaging_service_sid: 'MG6c8b3326fcd3fe9d373e5d8f798fb4df',      
    to: '+447538213479' 
  ) 
 
puts message.sid
