require 'twilio-ruby'

class TextSender

  def initialize(**twilio_creds)
    account_sid = twilio_creds[:account_sid]  || ENV["TWILIO_LIVE_SID"]
    auth_token  = twilio_creds[:auth_token]   || ENV["TWILIO_LIVE_TOKEN"]
    @from_no    = twilio_creds[:from_no]      || ENV["TWILIO_FROM_NO"]
    @to_no      = twilio_creds[:to_no]        || ENV["MY_PHONE_NO"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def text(message)
    @client.api.account.messages.create(
      from: @from_no,
      to: @to_no,
      body: message
    )
  end
end
