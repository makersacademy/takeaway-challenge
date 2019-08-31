require 'twilio-ruby'

account_sid = 'ACe6608e52a423ca7f1e73bcf6d34e2c53'
auth_token = 'fa63712f422de2119ef41c47ff47fd72'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441133205009' # Your Twilio number
to = '+447826028826' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered within the next 15 minutes"
)
