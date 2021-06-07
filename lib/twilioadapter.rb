require 'twilio-ruby'
require 'dotenv/load'

class TwilioAdapter
  
  def send_sms(message)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['MOBILE_NUMBER'],
      body: message,
    )
  end
end
