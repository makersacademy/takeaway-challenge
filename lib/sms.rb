require 'twilio-ruby'
require 'time'
require 'dotenv'

Dotenv.load

class SMS

  def initialize(time = Time.now)
    @time = time
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  # ------------------- PUBLIC INTERFACE (visible to Order) -------------------

  def send_text
    @client.messages.create(
      from: ENV['TWILIO_MOBILE'],
      to: ENV['CUSTOMER_MOBILE'],
      body: confirmation_message
    )
  end

  # ------------------- PUBLIC INTERFACE (visible to Order) -------------------

  private

  def confirmation_message(current_time = @time)
    time_stamp = current_time.strftime("%H:%M")
    message = "Thank you! Your order was placed at #{time_stamp} and will be delivered in half an hour."
  end

end
