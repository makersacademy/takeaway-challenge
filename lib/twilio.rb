require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

require_relative 'order'
require_relative 'dish'
require_relative 'menu'

use Rack::Session::Cookie, key: 'rack.session',
                           path: '/',
                           secret: 'can-be-anything-but-keep-a-secret'

# Return the session number for each sms received.
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
    message = cancel_order_message
  elsif body == 'MENU'
    mesage = menu_message(create_menu)
  elsif body == 'ORDER'
    message = order_info_message
  elsif order.dishes.length > 0
    session['order message'] = body
    message = order_confirming_message(order)
    session['stage'] = 'confirming'
  elsif session['stage'] == 'confirming'
    if body == 'YES'
      get_order(session['order message']).confirm
      message = confirmation_message
    elsif body == 'NO'
      session['stage'] = 'new'
      session['order message'] = nil
      message == cancel_order_message
    else
      message = try_again_message
    end
  else
    message = instructions_message
  end
  puts params
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: "TWILIVEROO\n\n#{message}")
  end

  session['counter'] += 1

  content_type 'text/xml'

  twiml.to_s
end

def order_info_message
  "To place order reply with the dish number and quantity one line per dish.\n\n"\
  "For example, if you would like to order 2 Pizzas and 3 Salads then:\n\n"\
  "1 2\n"\
  "3 3\n\n"\
  "Reply MENU to see the menu."
end

def menu_message(menu)
  "MENU\n\n"\
  "#{menu.print_out}\n\n"\
  "Reply ORDER to make an order."
end

def instructions_message
  "Reply MENU for a list of dishes.\n\n"\
  "Reply ORDER to make an order.\n\n"
end

def try_again_message
  "Command not understood. Please try again."
end

def confirming_message(order)
  message = "You have ordered:\n\n#{order.print_out}\n\nThe bill is £#{order.bill}\n\n"\
            "Reply YES to confirm and NO to cancel"
end

def confirmation_message
  now = Time.now
  delivery_time = "#{ now.hour + 1 }:#{ now.min }"
  "Thank you! Your order was placed and will be delivered before #{delivery_time}"
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
