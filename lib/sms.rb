require 'twilio-ruby'

class Sms

  def initialize
    @client = twilio_client
  end

  def send(message)
    @client.messages.create(
     from: from
     to: to
     body: message
    )
  end

private

  def twilio_client
    account_sid = account_sid
    auth_token = auth_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
