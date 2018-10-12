require 'twilio-ruby'

class TwilioClient
  def initialize
    account_sid = 'AC95f23a31e4b43442665d0a8c65271ee5'
    auth_token = '1aeed18dee8af028b1113e5b5f0d561b'

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(from_number_string, to_number_string, body_string)
    @client.api.account.messages.create(
      from: from_number_string,
      to: to_number_string,
      body: body_string
    )
  end
end
