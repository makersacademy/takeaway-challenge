require 'twilio-ruby'
require 'dotenv'

class Messenger
  def send_text(message, phone = Dotenv.load['TWILIO_DESTINATION_PHONE'])
    account_sid = Dotenv.load['TWILIO_ACCOUNT_SID']
    auth_token = Dotenv.load['TWILIO_AUTH_TOKEN']
    from_phone = Dotenv.load['TWILIO_PHONE']
    to_phone = phone

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: from_phone,
      to: to_phone,
      body: message
    )
  end
end
