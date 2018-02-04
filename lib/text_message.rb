require 'twilio-ruby'
require 'dotenv'

class TextMessage

  def send_text_message
    send_text
  end

  private

  def send_text(twilio_rest_client = Twilio::REST::Client, env = ENV)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    # message = @client.messages.create(
    @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: ENV["MY_NUMBER"],
      body: "Hello, your order will be with you in #{delivery_time}"
    )
  end

  def delivery_time
    time = Time.new
    # time = time.strftime("at %I:%M%p")
    p hour = time.strftime("%H")
    # time2 = time.strftime("#{hour}:%M")
    # "Thank you! Your order was placed and will be delivered before #{time2}"
  end
end
