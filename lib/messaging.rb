require 'twilio-ruby'

CONF = {
  account_sid: ENV['TWILIO_ACCOUNT_SID'],
  auth_token: ENV['TWILIO_AUTH_TOKEN'],
  from: ENV['TWILIO_FROM_NUMBER'],
  to: ENV['TWILIO_TO_NUMBER']
}.freeze

class Messaging
  def initialize
    @checkout_confirm = "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime('%H:%M')}"
  end

  def delivery_time
    Time.new + 3600
  end

  def send(message_text = @checkout_confirm)

  #   client = Twilio::REST::Client.new(CONF[:account_sid], CONF[:auth_token])
  #
  #   client.messages.create(
  #   from: CONF[:from],
  #   to: CONF[:to],
  #   body: message_text
  # )
  
  end
end
