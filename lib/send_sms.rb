require 'twilio-ruby'
require 'dotenv'
require 'dotenv/load'

class SendSms

  def initialize(client = Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"]))
    @client = client
    @time = (Time.now + (60*60)).strftime("%H:%M")
  end

  def send
    @client.messages.create(
      from: ENV["TWILIO_NUM"], # Your Twilio number
      to: ENV["MY_NUM"], # Your mobile phone number
      body: "Thank you! Your order was placed and will be delivered before #{@time}"
    )
  end
end
