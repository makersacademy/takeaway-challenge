require 'twilio-ruby'
require 'sinatra'

post '/receive_order' do
  body = params['Body'] + "\n"
  p "SMS Received"
  # hard coded.. run out of time to fix
  order_file = File.join(File.dirname(__FILE__), '../data/order.txt')
  File.write(order_file, body, mode: "a")

  p "Order Saved"

  # RUN THIS IN CLI TO OPEN A TUNNEL FROM LOCAL MACHINE
  # twilio phone-numbers:update "your phone number" --sms-url="http://localhost:4567/receive_order"

  # https://www.twilio.com/docs/sms/tutorials/how-to-receive-and-reply-ruby
  # https://www.oreilly.com/library/view/sinatra-up-and/9781449306847/ch04.html
end
