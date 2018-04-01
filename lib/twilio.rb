 require 'twilio-ruby'
 class Message
   def send_message

     account_sid = 'ACacf79708759e4c2197befcf51bdd4657'
     auth_token = '60e538a0f7f1c5eab311448ca180e02a'

     @client = Twilio::REST::Client.new account_sid, auth_token
     message = @client.messages.create(
       body: "Thank you Neil! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}",
       to: "+447935761438",
       from: "+441323700433"
     )
     puts message.sid
 end
end
