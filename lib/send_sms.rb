require 'twilio-ruby'
require 'dotenv/load'
Dotenv.load("lib/twilio.env")

class SendSms

  def send_sms(sms)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = ENV['TWILIO_NUMBER']
    to = ENV['MOBILE_NUMBER']

    client.messages.create(
      from: from,
      to: to,
      body: sms
    )
  end
end
