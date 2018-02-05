require "twilio-ruby"
require "dotenv"
Dotenv.load('hidden_data.env')

class Phone
  def send_text
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      body: "Thankyou! Your order was placed and will be delivered before 19:45",
      to: ENV["MY_NUMBER"],
      from: ENV["TWILIO_NUMBER"])
  end
end
