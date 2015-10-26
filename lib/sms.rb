require 'twilio-ruby'

class Sms

  def initialize(client_klass = Twilio::REST::Client)
    @client_klass = client_klass
    @client = get_client
  end

  def send(msg)
    from = ENV['TWILIO_NUMBER']
    to = ENV['MY_NUMBER']
    @client.account.messages.create(
          :from => from,
          :to => to,
          :body => msg)
  end

  private

  def get_client
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client_klass.new account_sid, auth_token
  end

end
