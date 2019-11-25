require 'rubygems'
require 'twilio-ruby'

class Sms

  def initilize
    @client = twilio = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_sms
    time = Time.new
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{time+3600}",
      from: ENV['TWILIO_PHONE'],
      to: ENV['TWILIO_DESTINATION_PHONE']
    )
  end
end
