require 'twilio-ruby'

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]
client = Twilio::REST::Client.new(account_sid, auth_token)

from = ENV["MY_TWILIO_PHONE_NUMBER"] 
to = ENV["MY_PHONE_NUMBER"] 

current_time = Time.now
delivery_time = current_time + 1800

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
)