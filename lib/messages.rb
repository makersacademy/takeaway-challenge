require 'twilio-ruby'
class Messages
  def send(message)
    account_sid, auth_token = ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from, to = ENV['TWILIO_NUMBER'], ENV['MY_NUMBER']

    client.api.account.messages.create(
    from: from,
    to: to,
    body: message
    )
    return message
  end
end
