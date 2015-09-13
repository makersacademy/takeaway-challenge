#require 'twilio-ruby'
require_relative 'order'
#require_relative '../../.env.rb'

class TextMessage

  def send_order_text number, order
    delivery_time = (Time.new + 3600).strftime("%H:%M")
    account_sid = KEYS[:account_sid]
    auth_token = KEYS[:auth_token]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.messages.create(
      from: KEYS[:phone_number].to_s,
      to: number,
      body: "Thank you! Your order \n\n" + order.display_order + "\nwill be"\
      " delivered before #{delivery_time}"
    )
  end

end
