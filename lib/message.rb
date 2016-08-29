require 'twilio-ruby'

class Message

  attr_reader :send_text

  def delivery_time
    time = Time.now + 60 * 60
    time.strftime("%H:%M")
  end

  def send_text
    account_sid = "AC4f30143cf5eccea4c0f4cb53848159b0"
    auth_token = "dafdda535cb4838d43f2fd45e9988591"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.messages.create(
    to: "+447761719320",
    from: "+441903680359",
    body: "Your order was placed and will be delivered before #{delivery_time}")
  end

end
