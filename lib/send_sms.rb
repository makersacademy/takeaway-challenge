# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'rubygems'
require 'twilio-ruby'

class Text
def text_send	
account_sid = 'ACc6ab8628503b6202c8a41c0af43b523d'
auth_token = '0b0716e11510e90c4d0c43dfe35fa700'
client = Twilio::REST::Client.new account_sid, auth_token

from = '+447533025648' # Your Twilio number
to = '+447428778796' # Your mobile phone number
 
time = (Time.new + 3600).strftime("%H:%M")

client.messages.create(
from: "+447533025648",
to: "+447428778796",
body: "Thank you! Your order was placed and will be delivered before " + time.to_s
)
end
end