require 'twilio-ruby'

account_sid = 'AC45dd85090d1836a01c68f0903749e58c'
auth_token = '9179f36e9294b9b0435e0464db5db449'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447411041875' # Your Twilio number
to = '+15555555555' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
