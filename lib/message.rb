require 'twilio-ruby'

class Message

  attr_reader :message

  def initialize(message)

    @message = message
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @from = ENV['TWILIO_PHONE']
    @to = ENV['MY_PHONE']

  end

  def send

    client = Twilio::REST::Client.new(@account_sid, @auth_token)

    client.messages.create(
    from: @from,
    to: @to,
    body: @message
    )

  end

end
