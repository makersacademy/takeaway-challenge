require_relative 'order.rb'
require 'twilio-ruby'

class MessageSender

  def send_sms(message)
    account_sid = 'AC67a8668352fe266e4a97871ce36e7ec8'
    auth_token  = 'b2c92aae0f1cb3ec86ed1df1eb3486a9'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    :from => +441273917043,
    :to   => +447966155030,
    :body => message
    })

  end
end
