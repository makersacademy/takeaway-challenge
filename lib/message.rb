require 'twilio-ruby'

class Message
  attr_reader :from, :to, :message

  def initialize(message)
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @from = '+447533006429'
    @to = '+447533105683'
    @message = message
  end

  def send
    @client.messages.create(
    from: @from,
    to: @to,
    body: @message
    )
  end
end
