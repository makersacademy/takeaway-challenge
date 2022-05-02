require 'twilio-ruby'
require 'dotenv'

class Text
  TIME_FORMAT = "%k:%M"

  attr_reader :mobile
  
  def initialize
    @mobile = ENV['CUST_NUMBER']
  end
  
  def send_message
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)  
    
    begin
      client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
        to: @mobile,
        from: ENV['TWILIO_NUMBER']
      )
      puts message.sid
    rescue
    end
  end

  def delivery_time
    time = (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end
