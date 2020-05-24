require 'dotenv/load'
require 'twilio-ruby'

class TextMessage

  def initialize(body, number)

    account_sid = ENV['ACCOUNT_SID'] 
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    send_message(body, number)

  end

  def send_message(body, number)

    from = '+18706864102' # Your Twilio number
    to = number # Your mobile phone number

    @client.messages.create(
      from: from,
      to: to,
      body: body
    )
  end

end
