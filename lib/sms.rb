require 'dat'
class SMS
  attr_reader :token, :number

  def initialize
    @token = Token::AUTH_TOKEN
    @number = Token::NUMBER
  end

  def send_sms(message)
    account_sid = 'AC033ff5fd1ab50ecf84e702ae695c4053'
    auth_token = token
    client = Twilio::REST::Client.new account_sid, auth_token

    client.messages.create(
    from: ['+441256830268'],
    to: ['+447515356421'],
    body: message
    )
  end
end
