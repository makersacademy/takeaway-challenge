require 'rubygems' 
require 'twilio-ruby'
 
class Checkout
    def pay_money(order, money_paid)
      if !money_paid || money_paid != order.order_total
        fail 'You have entered an incorrect amount, please reenter'
      else
        send_message
      end
    end
  
    def delivery_time
      @hourahead = Time.new + 3600
    end

    private

    def send_message
      delivery_time
      account_sid = '?' 

      auth_token = '?' 

      @client = Twilio::REST::Client.new(account_sid, auth_token) 
 

      message = @client.messages.create( 
                             body: 'Your order is coming',        
                             to: '?' 
                           ) 
 

                           puts message.sid
    end
end