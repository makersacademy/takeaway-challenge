require 'dotenv'
require 'twilio-ruby'
Dotenv.load

class TwilioHandler

  def self.send_message
    @client = Twilio::REST::Client.new ENV['ACC_SID'], ENV['AUTH_TOKEN']
    time = (Time.now + (60 * 60)).strftime("%H:%M")
    @client.account.messages.create(
        to: ENV['TWILIO_TO_NUMBER'],
        from: ENV['TWILIO_FROM_NUMBER'],
        body: "Thank you! Your order was placed and will be delivered " \
                 "before #{time}",
    )
  end

end
