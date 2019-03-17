require 'twilio-ruby'

# Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before 18:52"
)
