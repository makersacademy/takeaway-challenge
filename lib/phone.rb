require 'twilio-ruby'

class Phone

  ACCOUNT_SID = ENV["TWILIO_ACCOUNT_SID"]
  AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]
  CLIENT = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  FROM = '+441271410052' # Your Twilio number
  TO = '+447788205831'

  def send_text(message)
    CLIENT.messages.create(
    from: FROM,
    to: TO,
    body: message
    )
  end

end
