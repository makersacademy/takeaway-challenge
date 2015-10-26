require 'twilio-ruby'
require 'dotenv'

Dotenv.load

module SendText
  def send_text(basket_content, total)
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @message = @client.messages.create(
      to: ENV['SMS_TO'],
      from: ENV['SMS_FROM'],
      body: compose_message(basket_content, total)
    )
  end

  def compose_message(basket_content, total)
    text =  "Your order has been confirmed! \
            Expect your yummie food by #{delivery_time} \
            \n#{basket_content} \
            \n#{total}"
  end

  def delivery_time
    (Time.now + 60*60).strftime("%H:%m")
  end
end
