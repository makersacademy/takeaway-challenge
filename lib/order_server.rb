require 'twilio-ruby'
require 'sinatra'
require_relative '../lib/order_manager'
require_relative '../lib/order'
require_relative '../lib/menu'

# module OrderServerModule

#   class OrderServer < Sinatra::Base

#     def initialize(order_manager_class = OrderManager)
#       @order_manager_class = order_manager_class
#     end

post '/receive_order' do
  body = params['Body']
  p "SMS Received"
  # hard coded.. run out of time to fix
  menu_file = File.join(File.dirname(__FILE__), '../data/menu.csv')

  order_manager = OrderManager.new(menu_file, Menu, Order, Dish)
  order_manager.generate_order(body)
  p order_manager.order_history
  p "Order Created"

    # Only start a server if this file has been executed directly
    # run! if __FILE__ == $0

  # RUN THIS IN CLI TO OPEN A TUNNEL FROM LOCAL MACHINE
  # twilio phone-numbers:update "your phone number" --sms-url="http://localhost:4567/receive_order"

  # https://www.twilio.com/docs/sms/tutorials/how-to-receive-and-reply-ruby
  # https://www.oreilly.com/library/view/sinatra-up-and/9781449306847/ch04.html
 # end
end
