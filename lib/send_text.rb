require 'twilio-ruby'
require_relative 'delivery_time'

class SendText

  ACCOUNT_SID = 'AC762c2dec42d80e04def18dbbd0023dcf'
  AUTH_TOKEN = '9f10624ce074e048597ea1ec849578aa'

  def initialize(twilio = Twilio::REST::Client, del_time = DeliveryTime.new)
    @client = twilio.new(ACCOUNT_SID, AUTH_TOKEN)
    @delivery_time = del_time
  end

  def send
    time = @delivery_time.generate_time
    @message = @client.messages.create(
      body: "Thanks! Your order was placed, it'll be delivered before #{time}",
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
