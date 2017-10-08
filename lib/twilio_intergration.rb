module TwilioIntergration
  require 'twilio-ruby'
  require File.dirname(__FILE__) +'/hidden'

  ACCOUNT_SID = Hidden::ACCOUNT_SID
  AUTH_TOKEN = Hidden::AUTH_TOKEN 
  TWILIO_PHONE = Hidden::TWILIO_PHONE
  RECEIVERS_PHONE = Hidden::RECEIVERS_PHONE

  def self.send_sms(message, phone_number = RECEIVERS_PHONE)
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    client.api.account.messages.create(
      from: TWILIO_PHONE,
      to: phone_number,
      body: message
    )
  end
end
