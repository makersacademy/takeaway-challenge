module Text

  def send_message(number_to_send_to)
    twilio_sid = ENV['ACCOUNT_SID']
    twilio_token = ENV['AUTH_TOKEN']
    twilio_phone_number = ENV['PHONE_NUM']

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.messages.create(
      body:
        "Thank you! Your order was placed and will" \
          " be delivered within the next hour.",
      to: number_to_send_to,
      from: '+442820032756')
  end
end
