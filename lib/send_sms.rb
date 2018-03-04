require 'rubygems'
require 'twilio-ruby'

class SMS
  def self.send_sms(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    client = Twilio::REST::Client.new account_sid, auth_token

    from = ENV['TWILIO_PHONE']
    to = ENV['TWILIO_DESTINATION_PHONE']

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
