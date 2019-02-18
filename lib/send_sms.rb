require 'twilio-ruby'
require 'dotenv/load'

time = Time.new
delivery_time = "#{time.hour + 1}:#{time.min}"

account_sid = ENV['TWILIO_ACCOUNT_SID'] # Your Account SID from www.twilio.com/console
auth_token = ENV['TWILIO_ACCOUNT_AUTH_TOKEN']   # Your Auth Token from www.twilio.com/console
my_phone = ENV['MY_PHONE']

client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441227641123' # Your Twilio number
to = my_phone # Your mobile phone number

message = client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
)
