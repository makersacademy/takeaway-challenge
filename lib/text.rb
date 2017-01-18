require 'twilio-ruby'
require 'envyable'

class Text
  attr_reader :message

  TWILIO_ACCOUNT_SID = "test_sid"
  TWILIO_AUTH_TOKEN = "test_token"
  TO_NUMBER = "000"
  TWILIO_NUM = "111"

  def initialize(twilio_client_class = Twilio::REST::Client)
    @twilio_client_class = twilio_client_class
  end

  def send_message(total = 0)
    client_send(@message = generate_message(total))
    @message
  end

  private

  def generate_message(total = 0)
    # (Time.new + 3600).strftime('%I:%M%P')
    "Thank you! Your order came to £#{total}. "\
    "You can expect your delivery in 20 minutes"
  end

  def client_send(_message)
    @twilio_client_class.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN).account.messages.create(
      body: @message,
      to: TO_NUMBER,
      from: TWILIO_NUM)
  end
end
