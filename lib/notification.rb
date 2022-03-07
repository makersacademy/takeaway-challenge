require 'twilio-ruby'
require 'dotenv/load'

class Notification
  def initialize(order_time)
    @order_time = order_time
  end

  def send
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
        to: ENV['MY_PHONE_NUMBER'],
        from: ENV['TWILIO_PHONE_NUMBER'])
  end

  private

  def delivery_time
    delivery_time = @order_time + (60*60)
    delivery_time.strftime("%-k:%M")
  end
end