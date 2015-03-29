require 'twilio-ruby'

class MessageKlass
  attr_reader :send_text

  def send_text customer_number, customer_order
    fail unless customer_number && !customer_order.empty?

    account_sid = 'private'
    auth_token = 'private'

    @client = Twilio::REST::Client.new account_sid, auth_token

    conf_msg = {
      from: '+441412806132',
      to: customer_number,
      body: "Thank you! Your order will be delivered before #{d_time}"
    }

    @client.account.messages.create(conf_msg)
  end

  def d_time
    delivery_time = Time.now + 1 * 60 * 60
    delivery_time.strftime('%H:%M')
  end
end
