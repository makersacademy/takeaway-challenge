require 'twilio-ruby'

module SMS

  def send(account_sid, auth_token, twilio_phone, customer_phone)
    account_sid = "#{account_sid}"
    auth_token = "#{auth_token}"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: "#{twilio_phone}",
      to: "#{customer_phone}",
      body: "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%H:%M")}"
    )
  end

end
