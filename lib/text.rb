require 'twilio-ruby'
require 'time'
require_relative './twilio_private_data.rb'

class Text

  def send(text)
    account_sid = TwilioPrivateData::SID
    auth_token = TwilioPrivateData::TOKEN

    client = Twilio::REST::Client.new account_sid, auth_token

    client.messages.create(
        to: [TwilioPrivateData::TO],
        from: [TwilioPrivateData::FROM],
        body: text)
  end
end
