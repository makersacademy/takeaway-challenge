require 'rubygems'
require 'twilio-ruby'


# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = "AC78dea9435ef635785baf6bf720a4a9a6" #ENV['TWILIO_ACCOUNT_SID']
auth_token = "df0cdb7ed2d42940e009cee71e7bb643"
@client = Twilio::REST::Client.new(account_sid, auth_token)


delivery_time =  (Time.now + 3600) #time now plus 1 hour
delivery_time = delivery_time.strftime("%I:%M %p") #formats time to a more familar format a customer will easily understand

message = @client.messages
  .create(
     body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
     from: '+447411681971',
     to: '+447891144028'
   )

puts message.sid
