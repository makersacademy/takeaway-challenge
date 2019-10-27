require 'twilio-ruby'

class Sms

  def send_sms
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
      )

    client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['MOBILE'],
      body: sms
      )
  end

end
