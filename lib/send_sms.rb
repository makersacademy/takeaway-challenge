require 'dotenv/load'
require 'twilio-ruby'

class SendSMS
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = ENV['TWILIO_FROM']
  to = ENV['TWILIO_TO']

  client.messages.create(
  from: from,
  to: to,
  body: "your order has been placed"
  )
end