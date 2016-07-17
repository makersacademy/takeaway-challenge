require 'twilio-ruby'

class TwilioMessanger

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def message(message_body)
    @client.account.messages.create(
        to: ENV['TWILIO_MY_NUMBER'],
        from: ENV['TWILIO_NUMBER'],
        body: message_body,
    )
  end

end
