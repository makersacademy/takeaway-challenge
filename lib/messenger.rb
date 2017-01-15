require 'twilio-ruby'
require_relative 'takeaway'

class Messenger

  def send_message(message)
    client = Twilio::REST::Client.new("AC733e80d8eb5305704027651938977331", "dcefc4c1240246c8199c00577dee0116")
    client.messages.create(
      from: "+441133205947",
      to: "+447921613637",
      body: message
    )
  end
end
