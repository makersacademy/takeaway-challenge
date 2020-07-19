require 'twilio-ruby'

account_sid = 'AD45ff85090d1846a01c79p1903749m68c'
auth_token = '9179f71s9294b8p2435s0464db5rn929'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447411041875' # Your Twilio number
to = '+15555555555' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
