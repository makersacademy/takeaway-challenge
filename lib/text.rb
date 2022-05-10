require 'twilio-ruby'
require 'dotenv/load'

# Dotenv.load
class Text 

  
  def send_text
    account_sid = ENV['TWILIO_ACCOUNT_NUMBER'] # Your Test Account SID from www.twilio.com/console/settings
    auth_token = ENV['TWILIO_TOKEN']  # Your Test Auth Token from www.twilio.com/console/settings
  
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_NUMBER'], ENV['TWILIO_TOKEN'] 
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
      to: ENV['CUSTOMER_PHONE_NUMBER'],    # Replace with your phone number
      from: ENV['TWILIO_PHONE_NUMBER'])  # Use this Magic Number for creating SMS
    message.sid
  end

  private

  def delivery_time
    time = Time.now + 60 * 60
    time.strftime("%H:%M") 
  end
end
