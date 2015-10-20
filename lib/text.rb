require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  def send_text
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: ENV['TWILIO'],
      to: ENV['NUMBER'],
      body: payment_confirmation)
  end
end

private

def payment_confirmation
  "Thank you! Your order has been placed and will be delivered before "\
  "#{(Time.new + 3600).strftime("%H:%M")}."
end
