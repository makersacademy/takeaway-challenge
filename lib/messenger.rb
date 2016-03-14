require "rubygems"
require "twilio-ruby"
require "dotenv"
Dotenv.load

class Messenger
  def initialize(client)
    @client = client
  end

  def send(message)
    @client.account.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: ENV["RECEIVER_NUMBER"],
      body: message + " " + delivery_time
    )
  end

  def delivery_time
    "It will be delivered before #{Time.now.hour + 1}:#{Time.now.min}. :)"
  end
end
