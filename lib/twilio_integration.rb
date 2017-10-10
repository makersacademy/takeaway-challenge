require 'twilio-ruby'

module TwilioIntegration
  ACCOUNT_SID = ENV["TWILIO_ACCOUNT_SID"]
  AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"] 
  TWILIO_PHONE = ENV["TWILIO_PHONE"]
  RECEIVERS_PHONE = ENV["TWILIO_RECEIVERS_PHONE"]

  def self.send_sms(message, phone_number = RECEIVERS_PHONE)
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    client.api.account.messages.create(
      from: TWILIO_PHONE,
      to: phone_number,
      body: message
    )
  end
end
