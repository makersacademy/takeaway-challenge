module Text

   def send_message
     puts "Your order has been placed succesfully and should arrive before #{time}. Enjoy."
     account_details
     text_message
   end

  def account_details
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILLIO_NUMBER']
    to = ENV['MY_NUMBER']
  end

  def text_message
    client.messages.create(
    from: account_details.from,
    to: account_details.to,
    body: "Your order has been placed succesfully and should arrive before #{time}. Enjoy."
    )
  end

  def time
    time = Time.now + 1800
    time.strftime("%k:%M")
  end

end
