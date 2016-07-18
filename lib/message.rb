require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  attr_reader :send_text

  def delivery_time
    time = Time.new + 3600
    time.strftime("%H:%M")
  end

  def send_text
    (account_sid = ENV['ACCOUNT_SID'])
    (auth_token = ENV['AUTH_TOKEN'])
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.account.messages.create(
    from: ENV['TWILIO_NO'],
    to: ENV['MY_NO'],
    body: "Your order was placed and will be delivered before #{delivery_time}")
  end
end
