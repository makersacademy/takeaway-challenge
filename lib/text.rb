require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  attr_reader :sender, :client

  def initialize
    @sender = "441724411046"
  end

  def time
    delivery_time = (Time.new + 2700).strftime("%H:%M")
  end

  def send_text
    @client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
    @client.messages.create(
    body: "Thank you for your order. It will be delivered before #{time}",
    to: ENV["PHONE_NUMBER"],
    from: sender)
    'text sent'
  end
end
