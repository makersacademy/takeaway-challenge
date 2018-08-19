require 'twilio-ruby'

class SendText

  def initialize
    account_sid = 'AC762c2dec42d80e04def18dbbd0023dcf'
    auth_token = '9f10624ce074e048597ea1ec849578aa'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    message = @client.api.account.messages.create(
      body: "Hello there Ben",
      to: "+447891111865",
      from: "+447480538749"
    )
    message.sid
  end
end
