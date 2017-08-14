require 'twilio-ruby'

class Message
  attr_reader :price, :account_sid, :auth_token

  def intialize(price)
  	 @price = price
  	 account_sid = "ACec5b5f6454333fc143882a260de2a7b2" # Your Account SID from www.twilio.com/console
  	 auth_token = "your_auth_token" # Your Auth Token from www.twilio.com/console
  end

  def send_sms
  	 @client = Twilio::REST::Client.new account_sid, auth_token
  	 message = @client.messages.create(
   	    body: "Thank you placing the order! The total fee is #{price} and your delivery will be with you before 18:52",
   	    to: "+447590070810", # Replace with your phone number
   	    from: "+12345678901") # Replace with your Twilio number
  end
end
