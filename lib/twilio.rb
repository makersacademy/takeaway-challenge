require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
require 'messages'

require_relative 'order'
require_relative 'dish'
require_relative 'menu'

use Rack::Session::Cookie, key: 'rack.session',
                           path: '/',
                           secret: 'can-be-anything-but-keep-a-secret'

# include Messages

post '/sms' do

  session['counter'] ||= 0
  sms_count = session['counter']
  body = params['Body'].strip.upcase
  session['stage'] ||= 'new'
  stage = session['stage']

  order = get_order(body)

  if body == 'CANCEL ORDER'
    session['stage'] = 'new'
    session['order message'] = nil
    message = cancel_order
  elsif body == 'MENU'
    mesage = menu_message(create_menu)
  elsif body == 'ORDER'
    message = order_instructions
  elsif order.dishes.length > 0
    session['order message'] = body
    message = order_confirming(order)
    session['stage'] = 'confirming'
  elsif session['stage'] == 'confirming'
    if body == 'YES'
      get_order(session['order message']).confirm
      message = confirmation
    elsif body == 'NO'
      session['stage'] = 'new'
      session['order message'] = nil
      message == cancel_order
    else
      message = try_again
    end
  else
    message = instructions
  end

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: "TWILIVEROO\n\n#{message}")
  end

  session['counter'] += 1

  content_type 'text/xml'

  twiml.to_s
end

def create_menu
  pizza = Dish.new(name: 'Pizza', price:8.00)
  pasta = Dish.new(name:'Pasta', price:10.00)
  salad = Dish.new(name:'Salad', price:6.00)
  Menu.new(dishes: [pizza, pasta, salad])
end

def get_order(order_message)
  dishes = {}
  order_message.split("\n")
    .map(&:split)
    .map { |arr| arr.map(&:to_i) }
    .select { |arr| arr.length==2 && arr[0] != 0 && arr[1] != 0 }
    .each { |dish| dishes[menu.select_with_id(order[0]-1)] = order[1] }
  Order.new(dishes: dishes)
end
