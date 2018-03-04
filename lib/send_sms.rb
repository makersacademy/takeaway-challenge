# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'rubygems'
require 'twilio-ruby'

class Text
  def time
    (Time.new + 3600).strftime("%H:%M").to_s
  end  

  def text_send	
  account_sid = 'ACc6ab8628503b6202c8a41c0af43b523d'
  auth_token = File.read('twillio.key')
  client = Twilio::REST::Client.new account_sid, auth_token
  from = '+447533025648' # Your Twilio number
  to = '+447428778796' # Your mobile phone number
  client.messages.create(
  from: "+447533025648",
  to: "+447428778796",
  body: "Thank you! Your order was placed and will be delivered before " + time
  )
  end
end
