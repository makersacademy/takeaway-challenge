# Sends messages using Twilio integration
class Messenger
  def confirm(phone)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    message = client.messages.create(
    from: ENV['FROM_PHONE'],
    to: phone,
    body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M %d-%m-%Y")}"
    )
    message.sid
  end
end
