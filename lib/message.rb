require 'twilio-ruby'

class Message
  attr_reader :client
  SUCCESS_MSG = "Thank you! Your order was placed and will be delivered before 18:52"

  def initialize
    client = Twilio::REST::Client.new(
      ENV[TWILIO_ACCOUNT_SID],
      ENV[TWILIO_AUTH_TOKEN]
    )
  end

  def send
    client.messages.create(
      from: ENV[TWILIO_FROM_NUM],
      to: ENV[TWILIO_TO_NUM],
      body: SUCCESS_MSG
    )
  end
end
