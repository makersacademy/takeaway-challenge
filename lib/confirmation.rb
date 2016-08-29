require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Confirmation

  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACC_SID"],ENV["TWILIO_AUTH_TOKEN"])
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
    "Your order has been placed and will be with you in one hour"
  end

end
