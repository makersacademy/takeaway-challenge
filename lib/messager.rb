require "dotenv"
Dotenv.load

class Messager
  def initialize(total_price)
    @total_price = total_price
  end

  def send
    time = Time.now + 3600
    time = time.strftime("%H:%M")

    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV["TWILIO_NUM"]
    to = ENV["MY_NUM"] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Order confirmed! It will be ready at #{time}. Total: £#{@total_price}"
    )
  end
end