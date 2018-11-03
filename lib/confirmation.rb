require 'twilio-ruby'
require 'dotenv/load'

class Confirmation

  def initialize
    @account_sid = ENV['TWILIO_ACC_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = ENV['TWILIO_NUM']
    @to = ENV['RECEIVER_NUM']
  end

  def send_text
    time = Time.now + 3600
    @client.messages.create(
    from: @from,
    to:   @to,
    body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}"
    )
  end

end
