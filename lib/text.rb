require 'twilio-ruby'

class Text

  attr_reader :client

  def initialize(account_sid = ENV['TWILIO_ACCOUNT_SID'], auth_token = ENV['TWILIO_AUTH_TOKEN'])
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(message = customer_message)
    client.messages.create(message)
  end

  def customer_message
    {
    from: ENV['TWILIO_NUMBER'],
    to: ENV['CUSTOMER_NUMBER'],
    body: message_body
    }
  end

  def delivery_time
    (Time.now + 60 * 60).strftime("%H:%M")
  end

  def message_body
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end
end
