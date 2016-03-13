require 'twilio-ruby' 
require 'dotenv'
Dotenv.load

class Sms
  
  def initialize
    @cust_phone_number = ENV['CUSTOMER_PHONE_NUMBER']
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @delivery_time = ((Time.now + 60*60).strftime('%H:%M')) 
  end

  def send_order_confirmation
    message = @client.account.messages.create(
    :from => @twilio_number,
    :to => @cust_phone_number,
    :body => "Thank you! Your order was placed and will be delivered before #{@delivery_time}"
  )  
  end

end
  
