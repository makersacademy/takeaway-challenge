require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  def initialize(twilio_client=Twilio::REST::Client)
    @client = twilio_client.new(ENV["ACCOUNT_ID"], ENV["ACCOUNT_AUTH_TOKEN"])
  end

  def send_text
    delivery_time = Time.new + (60 * 60)
    @message = @client.messages.create(
    to: ENV["RECIP_NUMBER"],
    from: ENV["TWIL_NUMBER"],
    body: "Thank you! Your order was placed and will be delivered at #{delivery_time}."
    )
  end
end
