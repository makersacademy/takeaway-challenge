require 'twilio ruby'

client = Twilio::REST::Client.new(
  ENV[''] <- #TWILIO_ACCOUNT_SID
  ENV[''] <- #TWILIO_AUTH_TOKEN
)

client.messages.create(
  from: ENV[''], <- #TWILIO_PHONE_NUMBER
  to: ENV[''], <- #CELL_PHONE_NUMBER
  body: "" <- #
)
