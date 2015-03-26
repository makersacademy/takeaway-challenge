module Sms

  TWILIO_PHONE_NUMBER = "+441583612037"

  ACCOUNT_SID = 'AC08f8279f3edd79b7319ae767446c118d'
  AUTH_TOKEN = 'ae72651b676ffc8a4a5785f6d62b6664'
  
  def send_text_message(customers_phone_number, delivery_time)
    
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @client.messages.create(
      from: TWILIO_PHONE_NUMBER,
      to: customers_phone_number.to_s,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time.to_s[11..15]}"
    )
  end

end