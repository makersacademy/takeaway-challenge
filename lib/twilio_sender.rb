require 'twilio-ruby'

class Twilio_Sender

  def twilio_message
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+12532640401' # Your Twilio number
    to = '+447865193917' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: order_confirmation
    )
  end

  private

  def delivery_time
    time = Time.now + 60*60
    time.strftime("%k:%M")
  end

  def order_confirmation
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

end