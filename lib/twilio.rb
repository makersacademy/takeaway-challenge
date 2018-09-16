require 'order'
require 'twilio-ruby'

  account_sid = 'ACd4054020868dced4ab6097cdd7d42fdf' # Your Account SID from www.twilio.com/console
  auth_token = '95054951d7e50927c83edb088cb17771'   # Your Auth Token from www.twilio.com/console

  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before 20:15.",
      to: "+447498035939",    # Replace with your phone number
      from: "+447480487411")  # Replace with your Twilio number

  puts message.sid
