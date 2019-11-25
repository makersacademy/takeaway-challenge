class Text

  def initialize
    msg = "
    Thank you for your order.
    Your order was placed at: #{(Time.now).strftime("%H:%M")}

    It will be with you at approximately: #{(Time.now + 30 * 60).strftime("%H:%M")}"

    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
    
    client.messages.create(
      from: ENV['TWILIO_TEL_NUMBER'],
      to: ENV['TEL_NUM'],
      body: msg
    )
  end
end