require "yaml"
require "twilio-ruby"

class Text
  attr_reader :number, :client, :time
  CONFIG = YAML.load_file("config.yaml")
  DELIVERY_DELAY = 3600

  def initialize(phone_number)
    @number = phone_number
    @client = Twilio::REST::Client.new CONFIG["SID"], CONFIG["token"]
    @time = Time.new + DELIVERY_DELAY
    send
  end

  def message_creator
    "Thank you! Your order was placed and will be delivered before #{time.hour}:#{time.min}"
  end

  def send
    client.messages.create(
      to: number,
      from: CONFIG["sender"],
      body: message_creator
    )
    "Message sent"
  end
end
