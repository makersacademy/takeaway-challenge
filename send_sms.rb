# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
from_phone = ENV['FROM_PHONE']
to_phone = ENV['TO_PHONE']
client = Twilio::REST::Client.new(account_sid, auth_token)

from =  from_phone 
to =  to_phone

message = client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M %d-%m-%Y")}"
)

puts message.sid
