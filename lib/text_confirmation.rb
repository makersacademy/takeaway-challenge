require 'twilio-ruby' 
require 'date'
 
class Text
def initialize(client_number)
    @client_number = client_number
  end

  def time_estimate
    (Time.now + 3600).strftime("%k:%M")
  end

  def message
    account_sid = ENV['TWILIO_ACCOUNT_SID']       
    auth_token = ENV['TWILIO_AUTH_TOKEN']                                
    @client = Twilio::REST::Client.new(account_sid, auth_token) 

    message = @client.messages.create( 
    body: "Thank you! Your order was placed and
    will be delivered before #{time_estimate}",  
    from: ENV['BUSINESS_NUMBER'] ,              
    to: "#{@client_number}" )                                                       
    
    puts message.sid
  end
end
