require 'twilio-ruby'

class SendSMS
  attr_reader :client
  def initialize
    account_sid = '*****'
    auth_token = '*****'
    @to = "****"
    @from = "+441675292034"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send(text)
    message = @client.account.messages.create(
      body: text,
      to: @to,
      from: @from)
    text
  end
end
