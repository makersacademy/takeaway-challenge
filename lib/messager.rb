require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Messager

  def initialize(order)
    send_text(order)
  end

  def send_text(order)
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    @message = @client.messages.create(
      to: ENV['SMS_TO'],
      from: ENV['SMS_FROM'],
      body: compose_message(order)
    )
  end

  def compose_message(order)
    text =  "Your order has been confirmed! \
            Expect your yummie food by #{delivery_time} \
            \n#{order}"
  end

  def delivery_time
    (Time.now + 60*60).strftime("%H:%M")
  end
end
