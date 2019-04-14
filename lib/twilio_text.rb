
require 'twilio-ruby'
require 'denv'
Dotenv.load

class SMS
  def text_message
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
      from: ENV['TO'],
      to: ENV['FROM'],
      body: "Hey"
    )

    puts message.sid
  end
end
