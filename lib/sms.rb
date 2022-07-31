# require 'bundler'
# Bundler.require()
# require 'twilio-ruby'

class Sms
  def initialize
    account_sid = ENV['SID']
    auth_token = ENV['AUTH']

    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send    
    @client.messages.create(     
      to: ENV['number'],  
      from: '+447723917302',  
      body: message) 
  end

  def message    
    "Your order will be delivered before #{delivery_time}" 
  end

  def delivery_time    
    (Time.now + (60 * 60)).strftime("%H:%M")  
  end 
end