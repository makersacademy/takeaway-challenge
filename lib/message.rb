require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  def initialize(config = TWILIO_CONFIG, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def send_text
    client.messages.create(delivery_message)
  end

  private

  attr_reader :client, :config, :message

 TWILIO_CONFIG = {
    account_sid: ENV['TWILIO_ACCOUNT'],
    auth_token: ENV['TWILIO_AUTH'],
    from: ENV['TWILIO_NUMBER'],
    to: ENV['MY_NUMBER'],
    body: "Thank you! Your order will be delivered before "
  }.freeze

  def delivery_message
  {
    from: config[:from],
    to: config[:to],
    body: config[:body] + est_delivery_time
  }
  end

  def est_delivery_time
   (Time.now + (60*60) ).to_s
  end

end

