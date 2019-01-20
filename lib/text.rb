require ("bundler")
Bundler.require()

require 'rubygems'
require 'twilio-ruby'

class Text

  # Your Account Sid and Auth Token from twilio.com/console
  account_sid = 'AC18c856b9d47de2d9e6386709a5e65b9e'
  auth_token = 'e9b0292323f32a3f469837d56582fcb7'
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  @time = Time.new.strftime("at %I:%M%p")
  message = @client.messages
    .create(
       body: "Thank you! Your order was placed and will be delivered " + @time,
       from: '+441564432075',
       to: '+447561442804'
     )

  puts message.sid

end
