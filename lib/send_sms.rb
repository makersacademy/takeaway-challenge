require 'twilio-ruby'

class SendSms

  def initialize

    # put your own credentials here
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    # set up a client to talk to the SendSms REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

  end

  def create_message(text)
    @client.api.account.messages.create(
        from: ENV['TWILIO_FROM_NUMBER'],
        to: ENV['TWILIO_TO_NUMBER'],
        body: text
    )

  end

end