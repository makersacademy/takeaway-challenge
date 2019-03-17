require 'dotenv/load'
require 'twilio-ruby'

class Message

  def send_text
    text_content = create_text
    connect(text_content)
    text_content
  end

  def create_text
    delivery_window = 60 * 60 # 60*60 seconds = 1 hour
    delivery = Time.now + delivery_window

    arrival = "#{delivery.strftime('%H')}:#{delivery.strftime('%M')}"
    "Thank you! Your order was placed and will be delivered before #{arrival}"
  end

  private

  def connect(text_content)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['FROM_MOBILE_NUMBER'] # Your Twilio number
    to = ENV['TO_MOBILE_NUMBER'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: text_content
    )
  end
end
