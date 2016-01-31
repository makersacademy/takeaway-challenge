require_relative 'menu'
require_relative 'custy'

class Takeaway
   
   
   def initialize
      @custy_orders = []
   end
   
   def total(custy)
       "#{custy} your total is #{custy.total}"
   end
   
   def text
      account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
      auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
      
      @client = Twilio::REST::Client.new account_sid, auth_token
      
     @client.messages.create(
     from: '+14159341234',
     to: '+16105557069',
     body: 'Hey there!'
        )
       
   end
   
   
    
    
    
end