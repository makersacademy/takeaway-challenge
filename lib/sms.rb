require 'twilio-ruby'

class Sms
attr_reader :confirmation_sms
TWILIO_ACCOUNT_SID = "ACf5913cffd02b007aa9462769e71beb1d"
TWILIO_AUTH_TOKEN = "6a0b2df144dc5cccb6e9c60810686645"

  def confirmation_sms
    client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

    client.messages.create(
    from: "+441872672068",
    to: "+447716898344",
    body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60*60).strftime("%H:%M")} 🍣")
  end
end
