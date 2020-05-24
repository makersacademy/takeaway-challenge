require 'twilio-ruby'

ACCOUNT_SID = ENV[TWILIO_ACCOUNT_SID]
AUTH_TOKEN = ENV[AUTH_TOKEN]
NUM = ENV[NUM]

@client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

message = @client.messages
  .create (
  body: "Thank you, your order has been placed and will arrive at #{(Time.new + 1000).strftime("%H:%M")}."
  from: '+12513571363',
  to: NUM,
)


puts message.sid
