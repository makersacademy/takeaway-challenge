require 'twilio-ruby'

account_sid = 'AC9c21a11caf4a1045f79f695742aae881'
auth_token = 'a2669f5218a3e8f29703184280a528f7'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+442476100950' # Your Twilio number
to = '+447596529149' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "your order will arrive at #{Time.now.hour + 1}:#{Time.now.min}"
)
