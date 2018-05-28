require 'twilio-ruby'
require 'dotenv'

class TwilioNotification

  attr_reader :client, :delivery

  def initialize(account_sid = ENV['ACCOUNT_SID'], auth_token = ENV['AUTH_TOKEN'])
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV['TWILIO_PHONE']
    @to = ENV['RECEIVER']
    @time = Time.now
    @delivery = (@time +1*60*60).strftime('%H:%M')
  end

  def send_message
    client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will be delivered before #{delivery}"
    )
    "Message sent."
  end

end
