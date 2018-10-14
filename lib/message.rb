require 'twilio-ruby'

class Message

account_sid = 'AC89b769aa597ce85f6d827191ef79c9ab'
auth_token = '715daf1fb076cd56a7d7666d00776054'

@client = Twilio::REST::Client.new(account_sid, auth_token)
time = (Time.now + 3600)
message = @client.messages.create(

     body: "Thank you! Your order has been placed and will arrive before #{time}",
     from: '+441133203814',
     to: '+447528633162'
   )

puts message.sid

end
