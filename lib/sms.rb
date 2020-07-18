require_relative 'order.rb'

class Sms

  def send_sms(order = Order.new)

    require 'twilio-ruby'

    account_sid = 'AC6461bcffbe6f3e83dbe173cf19577ede'
    auth_token = '319e45ce15eed8cacdc4fb9231fb3853'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+12052067667' # Your Twilio number
    to = '+000000000000' # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: order.order_message
    )

  end
end
