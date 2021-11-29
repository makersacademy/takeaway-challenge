require 'envyable'
Envyable.load('./config/env.yml', 'development')
require 'twilio-ruby'

class TwilioProvider
  attr_reader :client
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  FROM_TAKEAWAY = '+12396884386'

  def initialize
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def send_text(customer_number = '+447588526828')
    @client.messages.create(
    from: FROM_TAKEAWAY,
    to: customer_number,
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end
end
