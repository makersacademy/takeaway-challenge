require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class Messenger

  def initialize(account_sid: ENV['TWILIO_ACCOUNT_SID'],
     auth_token: ENV['AUTH_TOKEN'],
     client: Twilio::REST::Client.new(account_sid, auth_token),
     from: ENV['FROM'],
     to: ENV['TO'])

    @client = client
    @from = from
    @to = to
  end

  def send_text
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will be delivered before #{expected_delivery_time}"
    )
  end

  private
  def expected_delivery_time
    (Time.now + 1 * 60 * 60).strftime("%H:%M")
  end

end
