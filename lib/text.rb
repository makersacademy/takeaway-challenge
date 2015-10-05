require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  def send_text
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    @client.account.messages.create(
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
