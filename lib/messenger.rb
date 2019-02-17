require 'twilio-ruby'

class Messenger
  TWILIO_PHONE_NUMBER = ENV['TWILIO_PHONE_NUMBER']
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

  def initialize
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def send_message(mobile_number:, message:)
    client.messages.create(
      from: TWILIO_PHONE_NUMBER,
      to: mobile_number,
      body: message
    )
  end
end