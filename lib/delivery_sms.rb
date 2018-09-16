require 'twilio-ruby'

class DeliverySMS

  ONE_HOUR = 3600

  def send
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    delivery_time = Time.new + ONE_HOUR

    from = ENV["TWILIO_PHONE_NUMBER"]
    to = ENV["MY_PHONE_NUMBER"]

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}"
    )
  end

end
