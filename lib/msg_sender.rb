# this classes responsibility is to send a text with a string once an order is placed
require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class MsgSender

  def complete_order
    send_text("Thank you! Your order was placed and will be delivered in 1 hour")
  end

  def send_text(text_message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: text_message,
        to: ENV['TWILIO_PHONE_NUMBER_OUT'],
        from: ENV['TWILIO_PHONE_NUMBER_IN'])

    puts message.sid
  end
end
