require 'twilio-ruby'

class TwilioAPI
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  TO = "+447748285100"
  FROM = "+441473379523"

  def send_message message_body
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    message = @client.account.messages.create(
      body: message_body,
      to: TO,
      from: FROM
      )
  end
end