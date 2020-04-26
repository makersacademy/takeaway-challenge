require 'twilio-ruby'

class RubyTwilio
  RECEIVER = ENV['RECEIVER']
  SENDER = ENV['SENDER']

  def send_confirmation_text
    set_up
    @client.messages.create(body: message, to: RECEIVER, from: SENDER)
  end

  private
  def set_up
    account_sid = ENV['TWILIO_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @client     = Twilio::REST::Client.new account_sid, auth_token
  end

  def message
    "Thank you! Your order was placed and will be delivered before #{eta}"
  end

  def eta
    hour_ahead = Time.now + (60 * 60)
    hour_ahead.strftime("%k:%M")
  end
end
