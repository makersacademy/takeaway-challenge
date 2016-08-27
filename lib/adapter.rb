require 'twilio-ruby'

# Understands how to interact with Twilio API
class Adapter
  def initialize
    @sid = ENV['TWILIO_ACCOUNT_SID']
    @token = ENV['TWILIO_AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']
    @phone_number = ENV['TEST_NUMBER']
  end

  def send_sms(message)
    client = Twilio::REST::Client.new sid, token
    client.account.messages.create(
      from: twilio_number,
      to: phone_number,
      body: message
    )
  end

  private

  attr_reader :sid, :token, :twilio_number, :phone_number
end
