require 'twilio-ruby'

class TwilioClient
  def initialize(twilio_number, client_number)
    account_sid = 'AC95f23a31e4b43442665d0a8c65271ee5'
    auth_token = '1aeed18dee8af028b1113e5b5f0d561b'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @from = twilio_number
    @to = client_number
  end

  attr_reader :from, :client




  def prepare_sms(timestamp)
    @timestamp = timestamp
    @body_message = "Thank you! Your order was placed and will be delivered before #{timestamp}"
    send_sms(@from, @to, @body_message)
  end

  private

  def send_sms(from_number_string, to_number_string, body_string)
    @client.api.account.messages.create(
      from: from_number_string,
      to: to_number_string,
      body: body_string
    )
  end
end
