require "twilio-ruby"

class SmsSender
  attr_reader :delivery_message

  def initialize(delivery_message)
    @delivery_message = delivery_message
  end

  def send_text(account_sid = "AC56a614c80c40b2d730f624b8f395bf10", auth_token = "b22114508794bdb02e7d2fe587e926c4", send_phone_num = "+19384440993")
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: @delivery_message,
      to: "+447947613279",    # Replace with your phone number
      from: send_phone_num,
    )

    p message.sid

    #   # POST /2010-04-01/Accounts/{AC56a614c80c40b2d730f624b8f395bf10}/Messages
  end
end
