require 'rubygems' 
require 'twilio' 

class Twilio
  def message
    account_sid = 'AC7c1e1a059b71f3e3be5280d996f93324' 
    auth_token = '#my AUTH KEY' 
    @client = Twilio::REST::Client.new(account_sid, auth_token) 
     
    message = @client.messages.create( 
                                 body: "You're order will be with you by #{Time.new + 3600}!",  
                                 messaging_service_sid: 'MG1fae5eda0d0314ed521604f6b5cb550f',      
                                 to: '#my_number' 
                               ) 
     
    puts message.sid
  end
end