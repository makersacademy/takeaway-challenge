require 'twilio-ruby'

def send_sms(message)
  account_sid = "#{$ACCOUNT_SID}"
  auth_token = "#{$AUTH_TOKEN}"
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = "#{$TWILIO_NUM}"
  to = "#{$MY_NUM}"

  client.messages.create(
  from: from,
  to: to,
  body: message
  )
end