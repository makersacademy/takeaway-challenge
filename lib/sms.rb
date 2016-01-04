require 'twilio-ruby'
require 'dotenv'

class SMS
  attr_reader :credentials, :phone_number

  def initialize
    @credentials = Dotenv.load
    @client = Twilio::REST::Client.new(credentials["TWILIO_ACCOUNT_SID"], credentials["TWILIO_AUTH_TOKEN"])
  end

  def send_sms(order_time, phone_number)
    @client.messages.create(
      from: credentials["TWILIO_SMS_NUMBER"],
      to: phone_number,
      body: "Thank you! Your order was placed and will be delivered before #{order_time.strftime("%H:%M")}"
    )
  end

end
