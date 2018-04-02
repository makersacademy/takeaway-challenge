

class Text_Messager do

  def send_text
    time = (Time.now + (60*60)).strftime('%H:%M')
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      .messages.create(
        from: ENV['TWILIO_PHONE'],
        to: ENV['TWILIO_DESTIN'],
        body: "Thank you! Your order was placed and will be delivered before #{time}"
      )
  end
end
