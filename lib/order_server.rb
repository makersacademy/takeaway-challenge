
require 'twilio-ruby'
require 'sinatra'

class OrderServer < Sinatra::Base

  def initialise(_order_manager)
    @order_class = order_class
  end

  post '/receive_order' do
    body = params['Body']
    order = order_manager.generate_order
    # Could use a response here and send an SMS back or use my SMS send 
    # Will look at this 
    # order.confirm_order(sms_client, "Order accepted via SMS")

  end

  # Only start a server if this file has been executed directly
  run! if __FILE__ == $0

# RUN THIS IN CLI TO OPEN A TUNNEL FROM LOCAL MACHINE
# twilio phone-numbers:update "your phone number" --sms-url="http://localhost:4567/receive_order"

# https://www.twilio.com/docs/sms/tutorials/how-to-receive-and-reply-ruby
# https://www.oreilly.com/library/view/sinatra-up-and/9781449306847/ch04.html
end
