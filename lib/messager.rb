require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Messager

  def send_message(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447449606023'
    to = ENV['NUM']

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
