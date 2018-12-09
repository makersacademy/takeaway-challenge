require 'twilio-ruby'

class Message

  ACC_SID = "AC03e3e64e1c4d3ee96ebe02eee3a3f113"
  TOKEN = "979e76ccb92cdbd44a8bec88be4bfb52"

  def initialize(twilio_client = Twilio::REST::Client.new(ACC_SID, TOKEN))
    @twilio_client = twilio_client
  end

  def send
    message = @twilio_client.messages.create(
      body: "Your order has been placed!
        It will be with you at: #{Time.now + 3600}",
      to: "+447427750432",
      from: "+441543624591")
    message.error_code.zero?
  end

end
