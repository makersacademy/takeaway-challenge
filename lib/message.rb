require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  attr_reader :send_text

  def delivery_time
    time = Time.now + 60 * 60
    time.strftime("%H:%M")
  end

  def send_text
    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.messages.create(
    to: ENV['MY_NUMBER'],
    from: ENV['TWILIO_NUMBER'],
    body: "Your order was placed and will be delivered before #{delivery_time}")
  end

end
