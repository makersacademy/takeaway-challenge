require 'twilio-ruby'

class Message
  def initialize(client: Twilio::REST::Client.new(
    ENV["MY_TWILIO_SID"],
    ENV["MY_TWILIO_AUTH_TOKEN"]))

    @client = client
  end

  def send
    @client.messages.create(
      body: "Thank you for your order! It will be arriving shortly",
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["MY_TWILO_PHONE_NUMBER"]
    )
  end
end
