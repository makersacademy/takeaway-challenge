require 'twilio-ruby'

class Messager
  def initialize
    account_sid = 'AC864c92d9bfea568ad8aeb5e76dd3fb7b'
    auth_token = '8fce14355955850dc8024dc2a85260c6'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @time = (Time.now + (60 * 60)).strftime("%H:%M")
  end

  def send_message
    @client.messages.create(
    from: '+447429428513',
    to: '+44736848165345',
    body: "Thank you! Your order was placed and will be delivered before #{@time}."
    )
  end
end
