require 'twilio-ruby'
require 'time'
require 'dotenv'

Dotenv.load

class SMS

  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_text
    @client.messages.create(
      from: '+441133205194',
      to: '+447719198784',
      body: confirmation_message
    )
  end

  private

  def confirmation_message
    current_time = Time.new
    time_stamp = current_time.strftime("%H:%M")
    message = "Thank you! Your order was placed at #{time_stamp} and will be delivered in half an hour."
  end

end
