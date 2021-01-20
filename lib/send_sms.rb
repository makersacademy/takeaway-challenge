require 'twilio-ruby'

time = Time.new + 3600 

account_sid = "AC7c0dd1eab28593f5ec87bb03c409e40b"
auth_token = "0b767001604b77a4e1c3e6585c909586"
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447862152030' # Your Twilio number
to = '+447725810503' # Your mobile phone number

client.messages.create(
from: "+447862152030",
to: "+447725810503",
body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%I:%M %p")}."
)