require 'rubygems' 
require 'twilio' 

class Twilio
  def message
    account_sid = 'AC7c1e1a059b71f3e3be5280d996f93324' 
    auth_token = '1e382af25e2b8322115664209b2fc4d9' 
    @client = Twilio::REST::Client.new(account_sid, auth_token) 
     
    message = @client.messages.create( 
                                 body: "You're order is on it's way!",  
                                 messaging_service_sid: 'MG1fae5eda0d0314ed521604f6b5cb550f',      
                                 to: '+447896606420' 
                               ) 
     
    puts message.sid
  end
end