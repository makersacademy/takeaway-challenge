require 'dotenv/load'
require 'twilio-ruby'

class Submission
  def initialize(order = Order.new)
    @order = order

    error_message = "Add items to order first. Cannot submit empty order."
    raise error_message if order.total.zero?

    submit_order
  end

  def submit_order
    sms_text = "Thank you! Your order was placed at 17:52 and should be with you by 18:52."    
    send_text(sms_text)
  end

  def send_text(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token

    client.messages.create(
      body: message,
      to: ENV['MY_NUMBER'],
      from: ENV['TWILIO_NUMBER'])

    return message
  
  end
end
