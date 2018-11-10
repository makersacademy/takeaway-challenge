# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC7701addf46457aa55d49fbdeb76669f9'
auth_token = '5592720efefea68a6cee9c9d2b6325e9'
client = Twilio::REST::Client.new(account_sid, auth_token)


client.messages.create(
from: '+441484599365', # Your Twilio number
to: '+447481966038', # Your mobile phone number
body: "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}""
)
