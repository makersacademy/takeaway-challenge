require("bundler")
Bundler.require()

class Messenger
  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = (Twilio::REST::Client.new(@account_sid, @auth_token))
  end


  def generate_message
    delivery_time = (Time.now + (60*60))
    @message_contents = "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%R")}"
  end

  def send_message
    @client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_PHONE_NUMBER"],
      body: @message_contents
    )
  end
end
