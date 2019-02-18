require 'twilio-ruby'
class MessageSender

  ACCOUNT_SID = 'AC52b6df9fca81f388cfa0dcdb8d6a09aa'
  AUTH_TOKEN = 'c01a66ea18bc5978da95d7d1135a770a'
  TWILIO_PHONE_NUMBER = '+441249400064'
  def initialize(twilio_class = Twilio::REST::Client)
    @twilio_class = twilio_class
    @client = @twilio_class.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def send_message(phone_number, time)
    @client.messages.create(
              from: TWILIO_PHONE_NUMBER,
              to: phone_number,
              body: "Thank you for the order. It will be delivered by #{time}"
              )
  end

end
