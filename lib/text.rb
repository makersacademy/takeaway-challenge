require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  CLIENT = Twilio::REST::Client.new(account_sid, auth_token)

  def send
    from = ENV['TWILIO_NUMBER'] # Your Twilio number
    to = ENV['MOBILE_NUMBER'] # Your mobile phone number
    time = (Time.now + 3600).strftime("%H:%M")

    CLIENT.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{time}"
    )
  end

end
