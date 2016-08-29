require 'twilio-ruby'
require 'dotenv'
Dotenv.load


class Text

  attr_reader :send_text, :ordertime
  def order_time
    time = Time.new + 3600
    time.strftime("%R")
  end

  def send_text

  (account_sid = ENV['TWILIO_ACCOUNT_SID'])
  (auth_token = ENV['TWILIO_AUTH_TOKEN'])

  @client = Twilio::REST::Client.new account_sid, auth_token

  @message = @client.messages.create(
    to: ENV['PHONE_TO'],
    from: ENV['PHONE_FROM'],
    body: "Thank you! Your order was placed and will be delivered before #{order_time}")
  end

end
