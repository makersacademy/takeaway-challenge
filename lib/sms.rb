require 'twilio-ruby'
require 'dotenv/load'

class SMS

  def initialize
    @client = Twilio::REST::Client.new(
    ENV["TWILIO_ACCOUNT_SID"],
    ENV["TWILIO_AUTH_TOKEN"]
    )
  end

  def send_message
    client.account.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: ENV["PERSONAL_PHONE_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 45*60).strftime("%H:%M")}"
      )
  end

  private
  attr_reader :client
end
