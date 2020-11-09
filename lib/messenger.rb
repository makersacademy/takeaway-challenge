require 'twilio-ruby'

class Messenger

  def send_confirmation_message(delivery_time)

    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILIO_NUMBER'] # Your Twilio number
    to = ENV['MY_NUMBER'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order from Rough Randy's Road Roasts will be delivered before #{delivery_time.strftime("%H:%M")}."
    )

  end

end
