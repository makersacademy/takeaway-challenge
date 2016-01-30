require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Text

  attr_reader :sender, :client, :credentials

  def initialize
    @credentials = Dotenv.load
  end

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

  def send_text
    @client = Twilio::REST::Client.new(credentials['account_sid'], credentials['auth_token'])
    @client.messages.create(
    body: "Thank you for your order. It will be delivered before #{delivery_time}",
    to: credentials['phone_number'],
    from: sender)
    'text sent'
  end
end
