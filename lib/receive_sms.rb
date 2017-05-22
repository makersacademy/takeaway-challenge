require 'dotenv/load'
Dotenv.load('settings.env')
require 'sinatra'
require './lib/restaurant.rb'
require 'twilio-ruby'

KFC = Restaurant.new("KFC", "Chingford")
KFC.menu.create_dish("Chicken Burguer", "Spicy!", 8)
KFC.menu.create_dish("Chicken Wings", "Spicy!", 2)

def initialize
  account_sid = ENV['ACCOUNT_SID']
  auth_token  = ENV['AUTH_TOKEN']
  @client     = Twilio::REST::Client.new account_sid, auth_token
  @customers  = []
end

def send_message(message_body, to_number)
  @client.account.messages.create(:body => "#{message_body}",
    :to   => customer_number,    
    :from => ENV['FROM_NUMBER'])
end

post '/receive-sms' do
  message_body = params["Body"]
  customer_number  = params["From"]
  content_type 'text/xml'
  if !@customers.include? customer_number
    send_message("Welcome to SMS2EAT!", customer_number)
    sms_initial_menu(customer_number)
    @customers << customer_number
    KFC.create_customer_order(customer_number)
    case message_body
    when "1"
      KFC.add_items_to_order(customer_number, "Chicken Burguer", 1)
      send_message("Chicken Burguer added to your order", customer_number)
    when "2"
      KFC.add_items_to_order(customer_number, "Chicken Wings", 1)
      send_message("Chicken Wings added to your order", customer_number)
    when "3"
      KFC.finalize_customer_order(customer_number)
      send_message("Thanks. Your order will be confirmed soon", customer_number)
      KFC.accept_customer_order(customer_number)
    end
  elsif @customers.include? customer_number
    case message_body
    when "1"
      KFC.add_items_to_order(customer_number, "Chicken Burguer", 1)
      send_message("Chicken Burguer added to your order", customer_number)
    when "2"
      KFC.add_items_to_order(customer_number, "Chicken Wings", 1)
      send_message("Chicken Wings added to your order", customer_number)
    when "3"
      KFC.finalize_customer_order(customer_number)
      send_message("Thanks. Your order will be confirmed soon", customer_number)
      KFC.accept_customer_order(customer_number)
    end
  end
end

def sms_initial_menu(to_number)
  send_message("SMS2EAT. Send 1 for Chicken Burguer (£8), 2 for Chicken Wings (£2)", customer_number)
  send_message("Send 3 to finalize order", customer_number)
end
