require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  CLIENT = Twilio::REST::Client.new(account_sid, auth_token)

  def send
    time = (Time.now + 3600).strftime("%H:%M")

    CLIENT.messages.create(
    from: ENV['TWILIO_NUMBER'],
    to: ENV['MOBILE_NUMBER'],
    body: "Thank you! Your order was placed and will be delivered before #{time}"
    )
  end

end
