# Responsible for sending order confirmation to customer

class Confirmation
  attr_reader :sms_sent

  def intitialize 
    # initialize with customer_number
    @sms_sent = false
  end

  def expected_delivery_time 
    time = Time.now + 3600
    time.strftime("%k:%M")    
  end

  def construct_body 
    "Thank you! Your order was placed and should be delivered before #{expected_delivery_time}"
  end

  def send_sms
    require 'twilio-ruby'
    account_sid = ENV['TWILIO_ACCOUNT_SID'] # ENV['TWILIO_TEST_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN'] # ENV['TWILIO_TEST_TOKEN'] 
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+447588713559' # magic number for tetsing +15005550006#
    to = '+447538172050' # customer_number (my number)
    client.messages.create(from: from, to: to, body: "#{construct_body}")
  
    @sms_sent = true
  end
end
