require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  def send_text
    delivery_time = Time.new + (60 * 60)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['ACCOUNT_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['RECIPIENT_NUMBER'],
      body: "Your order will arrive at #{delivery_time}."
    )
  end
end
