require 'twilio-ruby'

class SMSSender
  # To find these visit https://www.twilio.com/user/account
  TO_NUMBER = '+447914303594'
  FROM_NUMBER = '+441274288749'

  def initialize(sid, auth_token)
    @client = Twilio::REST::Client.new(sid, auth_token)
  end

  def send_message(order, total)
    dish_names = order.map { |item| item[:name] }.join("\n")
    @message = @client.messages.create(
      to: TO_NUMBER,
      from: FROM_NUMBER,
      body: "Here is your order: \n#{dish_names} \n Total: #{total}"
    )
  end
end
