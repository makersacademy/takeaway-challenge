require 'dotenv'
Dotenv.load('.env')

module Text

   def send_message
     account_sid = ENV['TWILIO_ACCOUNT_SID']
     auth_token = ENV['TWILIO_AUTH_TOKEN']
     from = ENV['TWILIO_NUMBER']
     to = ENV['MY_NUMBER']
     @client = Twilio::REST::Client.new(account_sid, auth_token)
     @client.messages.create(
     from: from,
     to: to,
     body: "Your order has been placed succesfully and should arrive before #{time}. Enjoy."
     )
     puts "Your order has been placed succesfully and should arrive before #{time}. Enjoy."
   end

  def time
    time = Time.now + 1800
    time.strftime("%k:%M")
  end

end
