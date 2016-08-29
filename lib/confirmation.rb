require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Confirmation

ACC_SID = ENV["TWILIO_ACC_SID"]
AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]

  def initialize(client = Twilio::REST::Client.new(ACC_SID, AUTH_TOKEN))
    @client = client
  end

  def send_message
    @client.messages.create(
    to: ENV["MY_NUM"],
    from: ENV["TWILIO_NUM"],
    body: message
    )
  end

  private

  def message
    "Your order has been placed and will be with you before #{expected_time}"
  end

  def expected_time
    (Time.now + 60*60).strftime("%H:%M")
  end

end
