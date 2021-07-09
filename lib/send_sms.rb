require 'twilio-ruby'

account_sid = 'AC8031abfd53753ded5e87e9e0ae013371'
auth_token = 'a4a66fa8e4a19a02d55539535ce19e55'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+17606243876' # Your Twilio number
to = '+447490999868' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Your order will be with you shortly"
)