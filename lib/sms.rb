require 'twilio-ruby' 
require 'dotenv'
Dotenv.load

class Sms
  
  attr_reader :client, :cust_phone_number, :twilio_number
  def initialize
    @cust_phone_number = ENV['CUSTOMER_PHONE_NUMBER']
    @twilio_number = ENV['TWILIO_NUMBER']
    delivery_time
  end

  def client
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

  def delivery_time
    @delivery_time = ((Time.now + 60*60).strftime('%H:%M')) 
  end

  def send_order_confirmation
    message = client.account.messages.create(
    :from => @twilio_number,
    :to => @cust_phone_number,
    :body => "Thank you! Your order was placed and will be delivered before #{@delivery_time}"
  )  
  end

end
  
