require 'twilio-ruby'

class MessageSender

  def initialize
    account_sid = 'AC57d9bec107ecc48cef5143a6e7b3642a'
    auth_token  = '8bb5a239dfcac0ac301f3a58e1e4b1ca'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(to, message)
    @client.messages.create(
      from:  '+441803500711',
      to:    to,
      body:  message
    )
  end

end
