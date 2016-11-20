require_relative 'order.rb'
require 'twilio-ruby'

class MessageSender

  def initialize
    account_sid = 'AC67a8668352fe266e4a97871ce36e7ec8'
    auth_token  = 'b2c92aae0f1cb3ec86ed1df1eb3486a9'

    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(to, message)
    @client.account.messages.create(
    from:  twilio_number,
    to:    to,
    body:  message,
    )
  end

  private

  def twilio_number
    twilio_number = '+441273917043'
  end
end
