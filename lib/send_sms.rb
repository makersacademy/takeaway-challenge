require 'twilio-ruby'

account_sid = "XXX"
auth_token = "XXXX"

client = Twilio::REST::Client.new(account_sid, auth_token)
  client.messages.create(
    to: 'XXXX',
    from: 'XXXX',
    body: "My fist sms"
  )
