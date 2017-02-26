require 'twilio-ruby'
require 'dotenv'

class SMSConfirmation

  def initialize(client = Twilio::REST::Client.new(ENV['SID'],ENV['TOKEN']))
    @client = client
  end

  def send_msg(msg = message)
    @client.messages.create(
    to: ENV['CUSTOMER_NUMBER'],
    from: ENV['TWILIO_NUMBER'],
    body: msg)
  end

  private

  def message
    est_time = (Time.new + 60*60).strftime("%H%M")
    "Thank you! Your order was placed and will be delivered before #{est_time}"
  end

end
