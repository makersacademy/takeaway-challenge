require 'twilio-ruby'

class TwilioSender

  attr_reader :from, :client, :account_sid, :auth_token

  def initialize
    @from = "____"
    @account_sid = '____'
    @auth_token = '____'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_text to, message
    message = @client.account.messages.create(
        body: message,
        to: to,
        from: @from,
        via: @client)
  end

end

t = TwilioSender.new
t.send_text '____', 'test'
