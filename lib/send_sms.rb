require 'twilio-ruby'

module SMS
  def send_sms(mobile, message)
    account_sid = 'ACe1ea62c79a551b623bb7aa126b0c5460'
    auth_token = 'f35f6122edaee5e0815e8995a4cb2e7a'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441290211294' # Your Twilio number

    client.messages.create(
    from: from,
    to: mobile,
    body: message
    )
    "Text sent"
  end
end
