require "rubygems"
require "twilio-ruby"
require "dotenv"
Dotenv.load

class Messenger

  def initialize
    @client = Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  end

  def send(message)
    @client.account.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: ENV["RECEIVER_NUMBER"],
      body: message + " " + delivery_time
    )
  end

  def delivery_time
    delivery = Time.now + 60*60
    "It will be delivered before #{delivery.strftime("%H:%M")}. :)"
  end
end
