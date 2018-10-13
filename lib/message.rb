require 'twilio-ruby'

class Message
  def initialize(client: Twilio::REST::Client.new(
    ENV["MY_TWILIO_SID"],
    ENV["MY_TWILIO_AUTH_TOKEN"]).messages)

    @client = client
  end

  def send
    @client.create(
      body: "Thank you for your order! It will be arriving shortly",
      to: "+447539225381",
      from: "+441133205022"
    )
  end
end
