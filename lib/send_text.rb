require 'twilio-ruby'

class SendText

  ACCOUNT_SID = 'AC762c2dec42d80e04def18dbbd0023dcf'
  AUTH_TOKEN = '9f10624ce074e048597ea1ec849578aa'

  def initialize(twilio_client = Twilio::REST::Client)
    @client = twilio_client.new(ACCOUNT_SID, AUTH_TOKEN)
    #p @client
  end

  def send
    @message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
      to: "+447891111865",
      from: "+447480538749"
    )
    raise "Sorry, text message failed to send!" unless message_sent?
  end

  private

  def delivery_time
    time = Time.now
    delivery_time = "#{time.hour + 1}:#{time.min}"
  end

  def message_sent?
    !!@message.sid
  end
end
