require "rubygems"
require "twilio-ruby"
require "dotenv"

class Messenger
  def initialize(client)
    @client = client
  end

  def send(message, phone = Dotenv.load['TWILIO_DESTINATION_PHONE'])

    @client.account.messages.create(
    from: Dotenv.load["TWILIO_PHONE"],
    to: phone,
    body: message
    )
  end

end
