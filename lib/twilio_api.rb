require 'twilio-ruby'

class TwilioAPI
  ACCOUNT_SID = 'AC77bdec879012715b3be201d758a8a70a'
  AUTH_TOKEN = '60d87c0a3794ca1ba40ae488173181d5'
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