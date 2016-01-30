require 'twilio-ruby'
require 'dotenv'
class Text

  attr_reader :sender, :client

  def initialize
    @sender = ENV["phone_number"]
  end

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

  def send_text
    @client = Twilio::REST::Client.new(ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
    @client.messages.create(
    body: "Thank you for your order. It will be delivered before #{delivery_time}",
    to: ENV["phone_number"],
    from: sender)
    'text sent'
  end

  def whats_dis
    p ENV["ACCOUNT_SID"]
    p ENV["AUTH_TOKEN"]
  end
end
