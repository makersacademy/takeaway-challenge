require 'twilio-ruby'

class Message

  def send_message
    time = Time.now + 1 * 60 * 60
    message = "Thank you for your order. Estimated delivery time is #{time.hour}
    :#{time.min}."

    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN'])
      .messages.create(
        from: "+15005550006",
        to: ENV['MY_NUMBER'],
        body: message
      )
  end

end
