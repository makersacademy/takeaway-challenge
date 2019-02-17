require './lib/secret'
require 'twilio-ruby'

class SMS
  attr_reader :msg

  def initialize
    @secret = Secret.new
    t = Time.now + 3600
    t = t.strftime("%H:%M")
    @msg = "Thank you! Your order was placed and will be delivered before #{t}"
    @destination = @secret.destination
    @origin = @secret.origin
  end

  def send
    client = Twilio::REST::Client.new(@secret.account_sid, @secret.auth_token)
    client.messages.create(
      from: @secret.origin,
      to: @destination,
      body: @msg
      )
  end

  def message_set?
    true unless @msg.empty?
  end

  def destination_set?
    true unless @destination.empty?
  end

end
