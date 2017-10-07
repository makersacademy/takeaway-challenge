module TwilioIntergration
  require 'twilio-ruby'

  def self.send_sms(message, phone_number = RECEIVERS_PHONE)
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    client.api.account.messages.create(
      from: TWILIO_PHONE,
      to: phone_number,
      body: message
    )
  end

  private
  ACCOUNT_SID = 'ACc7182fe3eed9aa00ada9834fbf0ce818'
  AUTH_TOKEN = '1c3da88d242cbd9a2deaed747bba5a09'
  TWILIO_PHONE = '+442380000702'
  RECEIVERS_PHONE = '+447491803825'
  end