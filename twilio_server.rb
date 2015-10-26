require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

require './lib/dish'
require './lib/menu'
require './lib/menufactory'
require './lib/orderfactory'
require './lib/order'
require './lib/invoice'
require './twilio'

menus = {
  :meatliquor => [{:name=>:nigiri_sushi, :price=>13.99},
                  {:name=>:tonkotsu_ramen, :price=>9.95},
                  {:name=>:teriyaki_salmon, :price=>8.80}],
  :nobu => [{:name=>:dead_hippy, :price=>8.99},
              {:name=>:black_palace, :price=>9.95},
              {:name=>:buffalo_chicken, :price=>8.80},
              {:name=>:cheese_fries, :price=>5.50}]
}

begin_order = "Thank you for hitting up Deon Dumplings, what restaurant would you like to order from? '\n'Please reply 'meatliquor' for Meat Liquor, "Nobu" for Nobu."

unrecognised_command = "Thank you for hitting up Deon Dumplings, your favourite double Ds. Text ordering is now supported, text 'order' to start!"


def text_menu(menu)
  menu_txt = ''
  menu.each {|key,value| menu_txt + "#{value}" +
    key == :price ? "'\n'" : " "}
  menu_txt
end

get '/sms-quickstart' do
  body = params['Body']
  puts params
  p params.inspect
  twiml = Twilio::TwiML::Response.new do |r|
    if body == 'order'
      r.Message(begin_order)
    elsif body == 'meatliquor'
      menu = MenuFactory.build(menus[:meatliquor])
      order = OrderFactory.load(menu)
      r.Message(text_menu(menus[:meat_market]))
    elsif body == 'nobu'
      menu = MenuFactory.build(menus[:nobu])
      order = OrderFactory.load(menu)
      r.Message(text_menu(menus[:nobu]))
    elsif body == 'nigiri_sushi'
      order.choose_item(:nigiri_sushi)
    elsif body == 'place_order'
      order.confirm_order
      order.place_order(ENV['PNUM'])
    else
      r.Message(unrecognised_command)
    end
  end
  twiml.text
end