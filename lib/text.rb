require 'twilio-ruby'

class Confirmation

def text

account_sid = 'ACd7bd438097782e4c79a158fb3500290e'
auth_token = 'ed0c45f4d04589b5cf5f1f488beeeb08'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+447533011143' # Your Twilio number
to = '+447746406608' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Order"
)

end
end
