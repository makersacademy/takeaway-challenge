require 'twilio-ruby'

module Sms
  def send_sms(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILIO_PHONE_FROM']
    to = ENV['TWILIO_PHONE_TO'] 

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
