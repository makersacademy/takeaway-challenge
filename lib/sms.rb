require_relative 'order.rb'

class Sms

  def send_sms(order = Order.new)

    require 'twilio-ruby'

    account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxx'
    auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyy'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+000000000000' # Your Twilio number
    to = '+000000000000' # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: order.order_message
    )

  end
end
