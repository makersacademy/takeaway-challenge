require 'twilio-ruby'

CONF = {
  account_sid: ENV['TWILIO_ACCOUNT_SID'],
  auth_token: ENV['TWILIO_AUTH_TOKEN'],
  from: ENV['TWILIO_FROM_NUMBER'],
  to: ENV['TWILIO_TO_NUMBER']
}

class Messaging
  def initialize
  end

  def message
    "Thank you! Your order was placed and will be delivered before #{Time.now}"
  end

  def send_message(message_text)
  #
  #   client = Twilio::REST::Client.new(CONF[:account_sid], CONF[:auth_token])
  #
  #   client.messages.create(
  #   from: CONF[:from],
  #   to: CONF[:to],
  #   body: message_text
  # )
  end
end
