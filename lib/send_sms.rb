#I need to make this into a class and set up a method to send the text. Currently, it sends the sms when IRB boots up.
require 'twilio-ruby'

account_sid = 'ACeb57b6f70b6a75bc1ac05158bdd48d9c'
auth_token = ''
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447782338793'
to = '+44' 

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{Time.now + 1*60*60}!"
)
