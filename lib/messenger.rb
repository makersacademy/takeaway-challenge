require "rubygems"
require "twilio-ruby"
require "dotenv"
Dotenv.load

class Messenger
  def initialize(client)
    @client = client
  end

  def send(message, phone = ENV['TWILIO_DESTINATION_PHONE'])

    @client.account.messages.create(
    from: ENV["TWILIO_PHONE"],
    to: phone,
    body: message
    )
  end

end
