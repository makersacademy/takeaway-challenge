require 'twilio-ruby'
require_relative 'order'


class CheckOrder

   attr_reader :total_bill, :order

    def initialize customer_order = Order.new
      @order = customer_order
    end

    def confirmation
      verify_total_bill
      p client_msg
      client_response
      authorization_check
    end


   private

   def each_price
     @order.final_order.map {|item| item[:price] }
   end

   def msg_system_setup
     account_sid = 'AC6a76baf858c5a70638ec20fb06ca5eb7'
     auth_token = '11324e418c312d69dee1fdfabf04f5c8'
     @client = Twilio::REST::Client.new account_sid, auth_token
   end

   def authorize_order
      msg_system_setup
      @client.messages.create(
      from: '+441349344055',
      to: '+447342783388',
      body: 'Thank you! Your order was placed and will be delivered before 18:52'
      )
    end

    def client_msg
      "Please verify that your total is $ #{@total_bill} is correct by entering 'y' or incorect by entering 'n'"
    end

    def client_response
      @client_response = gets.chomp
    end

    def authorization_check
      authorize_order if @client_response == 'y'
    end

    def verify_total_bill
     @total_bill = each_price.inject(:+)
    end

end



