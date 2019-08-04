module SMS

  require 'twilio-ruby'

  ACCOUNT_SID = ENV["TWILIO_SID"]
  AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]
  CLIENT = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

  FROM = ENV["TWILIO_PHONE"] # Your Twilio number
  TO = ENV["MY_PHONE"] # Your mobile phone number

  def send_text(message, client: CLIENT, from: FROM, to: TO)
    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end

end
