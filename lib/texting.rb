require 'twilio-ruby'
require 'dotenv/load'

class Texting

  def self.send_sms(order_confirmation)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILIO_NUMBER'] # Your Twilio number
    to = ENV['TLF_NUMBER'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: order_confirmation
    )
  end
end
