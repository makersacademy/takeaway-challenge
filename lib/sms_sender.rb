require 'twilio-ruby'

class SMSSender
  # To find these visit https://www.twilio.com/user/account
  ACCOUNT_SID = "AC41c53cb8424c27922dec36f543fb0614"
  AUTH_TOKEN = "a9d000d445b11aa0cb7d9dabc8367cd4"
  TO_NUMBER = '+447914303594'
  FROM_NUMBER = '+441274288749'

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
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
