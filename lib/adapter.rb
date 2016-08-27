require 'twilio-ruby'

class Adapter
  def send_sms(message)
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['TWILIO_NUMBER']
    phone_number = ENV['TEST_NUMBER']
    outgoing = client.account.messages.create(
      from: twilio_number,
      to: phone_number,
      body: message,
    )
  end
end
