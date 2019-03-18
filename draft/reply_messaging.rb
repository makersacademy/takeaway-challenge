require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'
require_relative 'menu'

get '/' do
  'Hello world!'
end

use Rack::Session::Cookie, key: 'rack.session', path: '/', secret: '000'

# Return the session number for each sms received.
post '/sms' do
  body = params['Body'].downcase

  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
        if body == '1'
          resp.message body: 'App Menu'
          redirect '/sms/app_menu'
        elsif body == '2'
          resp.message body: 'Show dishes'   
          redirect '/sms/show_dishes'
        elsif body == '3'
          resp.message body: 'Select dishes'
          redirect '/sms/order'
        else 
          resp.message body: body
          redirect "/sms/selection?body=#{body}"
        end
      end

  content_type 'text/xml'

  twiml.to_s
end

post '/sms/app_menu' do
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: "Options
       1. Show menu\n
       2. Select dishes\n
       3. Verify order\n
       4. Submit order")
  end

  content_type 'text/xml'

  twiml.to_s
end

post '/sms/show_dishes' do

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: 'Menu
       1: Onion, Rosemary & Cheddar - 11
       2: Smoked Cod’s Roe, Fermented Cabbage & Caraway - 20
       3: Duck Sausage & Fennel - 25')
  end

  content_type 'text/xml'

  twiml.to_s

end

post '/sms/selection' do
  order = params[:body].downcase
  order_param = order.split("").map(&:to_i)
  
  menu = Menu.new
  selection = menu.select_dishes(order_param)
  total = menu.total

  message =  
  "You have ordered:
  #{selection.each do |item|
    "#{item.name} - #{item.price}"
   end
  }"

    p message
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: message)
  end

  content_type 'text/xml'

  twiml.to_s

end