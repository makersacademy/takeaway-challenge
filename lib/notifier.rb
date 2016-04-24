require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Notifier 
  
  def initialize(client = Twilio::REST::Client.new(ENV['SID'], ENV['TOKEN']))
    @client = client
  end
  
  def send_sms
    @client.account.messages.create(
			from: ENV['TWILIO_NUMBER'], 
			to: ENV['MY_NUMBER'], 
			body: "Thank you!. Your order was placed and will be delivered before #{delivery_time}"
    )
  end
  
  private
    attr_reader :client
  
    def delivery_time
      (Time.now + 3600).strftime("%H:%M")
    end
end