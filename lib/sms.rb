require './lib/secret'
require 'twilio-ruby'

class SMS
  attr_reader :message

  def initialize
    @secret = Secret.new
    eta = Time.now + 3600
    @message = "Thank you! Your order was placed and will be delivered before #{eta.strftime("%H:%M")}"
    @destination = @secret.destination
    @origin = @secret.origin
  end

  def send
    client = Twilio::REST::Client.new(@secret.account_sid, @secret.auth_token)
    client.messages.create(
      from: @secret.origin,
      to: @destination,
      body: @message
      )
  end

  def message_set?
    true unless @message.empty?
  end

  def destination_set?
    true unless @destination.empty?
  end
  
end
