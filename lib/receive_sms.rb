require 'dotenv/load'
Dotenv.load('settings.env')
require 'sinatra'
require './lib/restaurant.rb'
require 'twilio-ruby'

KFC = Restaurant.new("KFC","Chingford")
KFC.menu.create_dish("Chicken Burguer","Spicy!",8)
KFC.menu.create_dish("Chicken Wings","Spicy!",2)

def initialize
  account_sid = ENV['ACCOUNT_SID']
  auth_token  = ENV['AUTH_TOKEN']
  @client     = Twilio::REST::Client.new account_sid, auth_token
  @customers  = []
end

def send_message(message_body, to_number)
  @client.account.messages.create(:body => "#{message_body}",
    :to   => to_number,    
    :from => ENV['FROM_NUMBER'])
end

post '/receive-sms' do
  message_body = params["Body"]
  from_number  = params["From"]
  content_type 'text/xml'
  if !@customers.include? from_number
    send_message("Welcome to SMS2EAT!", from_number)
    sms_initial_menu(from_number)
    @customers << from_number
    KFC.create_customer_order(from_number)
    case message_body
    when "1"
      KFC.add_items_to_order(from_number, "Chicken Burguer", 1)
      send_message("Chicken Burguer added to your order",from_number)
    when "2"
      KFC.add_items_to_order(from_number, "Chicken Wings", 1)
      send_message("Chicken Wings added to your order",from_number)
    when "3"
      KFC.finalize_customer_order(from_number)
      send_message("Thanks. Your order will be confirmed soon",from_number)
      KFC.accept_customer_order(from_number)
    end
  elsif @customers.include? from_number
    case message_body
    when "1"
      KFC.add_items_to_order(from_number, "Chicken Burguer", 1)
      send_message("Chicken Burguer added to your order",from_number)
    when "2"
      KFC.add_items_to_order(from_number, "Chicken Wings", 1)
      send_message("Chicken Wings added to your order",from_number)
    when "3"
      KFC.finalize_customer_order(from_number)
      send_message("Thanks. Your order will be confirmed soon",from_number)
      KFC.accept_customer_order(from_number)
    end
  end
end

def sms_initial_menu(from_number)
  send_message("Send 1 to order: a Chicken Burguer (£8)",from_number)
  send_message("Send 2 to order: Chicken Wings (£2)",from_number)
  send_message("Send 3 finalize order",from_number)
end
