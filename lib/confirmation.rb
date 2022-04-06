require 'rubygems' 
require 'twilio-ruby'

class Confirmation

  def text
    account_sid = 'AC75eee964c7c1cbae36cc763754434b85' 
    auth_token = '[AuthToken]' 
    @client = Twilio::REST::Client.new(account_sid, auth_token) 
 
    message = @client.messages.create( 
                             body: "Thanks for ordering, your meal will be delivered before #{Time.now + 3600}",  
                             messaging_service_sid: 'Another phone number',      
                             to: 'A phone number' 
                           ) 
    puts message.sid
  end
end
