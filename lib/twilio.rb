require 'twilio-ruby'

class RubyTwilio
  RECEIVER = "+44 7919 912139"
  SENDER = "+18452500895"

  def send_confirmation_text
    set_up
    @client.messages.create(body: message, to: RECEIVER, from: SENDER)
  end

  private
  def set_up
    account_sid = "AC17c7f225973a0fdaf83cf81958edf728"
    auth_token = "7ef4b3f68887aec6b7977df39a6801f2"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def message
    "Thank you! Your order was placed and will be delivered before #{eta}"
  end

  def eta
    hour_ahead = Time.now + (60 * 60)
    hour_ahead.strftime("%k:%M")
  end
end
