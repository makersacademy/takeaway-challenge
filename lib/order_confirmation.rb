require "twilio-ruby"
require "dotenv/load"

class OrderConfirmation
  def initialize
    @time = Time.now + 1 * 60 * 60
    account_sid = ENV["MY_TWILIO_ACC_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
  end

  def send_text
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{@time.strftime("%H:%M")}",
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_NUMBER"],
    )

    puts message.sid
  end
end

order = OrderConfirmation.new
order.send_text
