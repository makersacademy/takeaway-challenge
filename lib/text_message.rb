require 'twilio-ruby'
require 'dotenv'
Dotenv.load("data.env")

class TextMessage

  def send
    send_text
  end

  private

  def send_text
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: ENV["MY_NUMBER"],
      body: "Hello, your order will be with you by #{delivery_time}"
    )
  end

  def delivery_time
    time = Time.new
    plus_one_hour = time.strftime("%H").to_i + 1
    time.strftime("#{plus_one_hour}:%M")
  end
end
