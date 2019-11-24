require "twilio-ruby"
require "dotenv/load"

class TextProvider
  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end

  def send_text(time)
    message = "Thank you! Your order was placed and will be delivered before #{time}"
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: ENV["MY_PHONE_NUMBER"],
      body: message)
  end
end
