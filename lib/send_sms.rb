require 'twilio-ruby'
require 'dotenv'

class Send_SMS

  attr_reader :credentials

  def initialize
    @credentials = Dotenv.load
  end

  def confirmation_text
    sender
  end


  private

  def sender
    message1 = "Thank you!, your order was placed and "
    message2 = "will be delivered before #{stamp_time}"

    client = Twilio::REST::Client.new credentials["sid"], credentials["token"]

    client.account.messages.create(from: credentials["TWILIO_NUMBER"], to: credentials["MY_NUMBER"],
    body: message1 + message2)
  end

  def stamp_time
    (Time.now+3600).strftime("%I:%M%p")
  end

end
