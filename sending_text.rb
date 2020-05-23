require 'twilio-ruby'

ACCOUNT_SID = ENV[TWILIO_ACCOUNT_SID]
AUTH_TOKEN = ENV[AUTH_TOKEN]
NUM = ENV[NUM]

client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

  to: NUM,  
  from: '+15005550006'  #User our Magic number to create test calls from

client.messages.create (
  from: from,
  to: to,
  body: "Thank you, your order has been placed and will arrive at #{(Time.new + 1000).strftime("%H:%M")}."
)