require 'twilio-ruby'

class Text_message

  def initialize(body)

    account_sid = "ACa8b2e7a32a24e06e9b6eba9fc11a96a5"
    auth_token = "fa4b5da380abc4ec77d146a62b594c45"

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    send_message(body)

  end

  def send_message(body)

    from = '+18706864102' # Your Twilio number
    to = '' # Your mobile phone number

    @client.messages.create(
      from: from,
      to: to,
      body: body
    )
  end

end
