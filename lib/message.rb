require 'twilio-ruby'

class TextMessage
  attr_reader :send_sms

  TWILIO_ACC_SID = 'AC4b920e4f9d755d618d14e248b3f39fa8'
  TWILIO_AUTH_TOKEN = '818c6b68bb18c8aaf354cb54d1ea07cd'
  TWILIO_ACC_NUMBER = '+441669912048'
  PHONE_NUMBER = '+447453572037' 

  def send_sms
    time = (Time.now + 60 * 60).strftime("%k:%M")
    client = Twilio::REST::Client.new(TWILIO_ACC_SID, TWILIO_AUTH_TOKEN)
    client.messages.create(
      from: TWILIO_ACC_NUMBER,
      to: PHONE_NUMBER,
      body: "Thank you! Your order was placed and will be delivered before #{time}."
    )
  end

  
end
