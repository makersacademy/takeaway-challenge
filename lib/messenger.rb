require 'twilio-ruby'
require 'dotenv'

class Messenger


  def send_message(text)
    Dotenv.load
      sid = ENV['ACCOUNT_SID']
      token = ENV['AUTH_TOKEN']
      client_phone_number = ENV['CLIENT_PHONE_NUMBER']
      twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

      client = Twilio::REST::Client.new(sid, token)

      client.messages.create(
        to: client_phone_number,
        from: twilio_phone_number,
        body: text
      )
  end
end
