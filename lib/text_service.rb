require 'dotenv/load'
require 'twilio-ruby'

class TextService
  def send_text(message)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['SENDER'] # Your Twilio number
    to = ENV['RECIPIENT'] # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: message
    )
   end
end
