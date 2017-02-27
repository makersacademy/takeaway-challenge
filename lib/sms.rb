require 'twilio-ruby'
require 'dotenv'

class SMS

  def send_text
    Dotenv.load
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @client.messages.create(
      from: "+441633530244",
      to: "+447847470091",
      body: "Your order has been confirmed, and will be delivered at #{(Time.now + 60*60).strftime("%H:%M")}"
    )
  end

end
