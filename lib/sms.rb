require 'twilio-ruby'

class Sms

  attr_reader :client

  def initialize(client_klass = Twilio::REST::Client)
    @client = client_klass.new(account_sid, auth_token)
  end

  def send(msg)
    from = ENV['TWILIO_NUMBER']
    to = ENV['MY_NUMBER']
    self.client.account.messages.create(from: from, to: to, body: msg)
  end

  private

  def account_sid
    ENV['TWILIO_SID']
  end

  def auth_token
    ENV['TWILIO_TOKEN']
  end

end
