require 'twilio-ruby'
require_relative './../text_data'

class Texter
  include TextData

  def send_text(cost)
    soon = Time.now + 3600
    @client.messages.create(
      from: @from,
      to: @to,
      body: "You'll get your £#{cost} worth of "\
        "food by #{soon.strftime("%H:%M")}"
    )
    return "sent"
  end

end
