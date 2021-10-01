require 'twilio-ruby'

ACCOUNT_SID = ENV['TWILIO_SID']
AUTH_TOKEN = ENV['TWILIO_TOKEN']
RESTAURANT_PHONE = ENV['TWILIO_PHONE']
CUSTOMER_PHONE = ENV['MY_PHONE']

class Confirmation
  def initialize(order_time = Time.now)
    @order_time = order_time
    @delivery_time = order_time + 3600
    @delivery_time_hour = @delivery_time.hour
    @delivery_time_minute = @delivery_time.min
  end
  def content
    "Thank you! Your order was placed and will be delivered before #{@delivery_time_hour}:#{@delivery_time_minute}"
  end
  def send_confirmation
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    
    client.messages.create(
    from: RESTAURANT_PHONE,
    to: CUSTOMER_PHONE,
    body: content
    )
  end
end