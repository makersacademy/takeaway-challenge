require 'dotenv/load'
require 'twilio-ruby'

class TextProvider
  def send_text
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'],
    ENV['TWILIO_AUTH_TOKEN']).messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['NUMBER'],
      body: (Time.now + 3600).strftime("Thank you!
      Your order was placed and will be delivered before %k:%M")
    )
  end
end
