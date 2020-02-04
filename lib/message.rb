require 'twilio-ruby'

class Message
  def send(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    from = ENV['TWILIO_NUMBER']
    to = ENV['MY_NUMBER']

    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.api.account.messages.create(
    from: from,
    to: to,
    body: message
    )
    end
end
