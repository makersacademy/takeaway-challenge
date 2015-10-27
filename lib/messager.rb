require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Messager

  def initialize
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

  def send_text(order)
    @message = @client.messages.create(
      to: ENV['SMS_TO'],
      from: ENV['SMS_FROM'],
      body: compose_message(order)
    )
  end

  private
  def compose_message(order)
    "Your order has been confirmed! \
    Expect your yummie food by #{delivery_time} \
    \n#{order}"
  end

  def delivery_time
    (Time.now + 60*60).strftime("%H:%M")
  end
end
