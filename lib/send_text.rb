require 'twilio-ruby'

class SendText

  ACCOUNT_SID = 'AC762c2dec42d80e04def18dbbd0023dcf'
  AUTH_TOKEN = '9f10624ce074e048597ea1ec849578aa'

  def initialize(twilio_client = Twilio::REST::Client, delivery_time = DeliveryTime.new)
    @client = twilio_client.new(ACCOUNT_SID, AUTH_TOKEN)
    @delivery_time = delivery_time
  end

  def send
    time = @delivery_time.generate_time
    @message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{time}",
      to: "+447891111865",
      from: "+447480538749"
    )
    raise "Sorry, text message failed to send!" unless message_sent?
  end

  private

  def message_sent?
    !!@message.sid
  end

end
