require 'twilio-ruby'

class Message

  def initialize(message)

    @message = message

  end

  def send

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILIO_PHONE'] # Your Twilio number
    to = ENV['MY_PHONE'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: @message
    )

  end

end
