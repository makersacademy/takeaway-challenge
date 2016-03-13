require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
require_relative 'sms_message'
require 'dotenv'
Dotenv.load

get '/sms' do
  incoming = params[:Body]
  begin order = eval(incoming)
    if order.empty?
      response = "Your order contained no items."
    else
      response = format_order(order)
    end
  rescue Exception => exc
    response = "Exception: #{exc}"
  end

  twiml = Twilio::TwiML::Response.new do |r|
    r.Message response
  end
  twiml.text
end

def format_order(order)
  message = "Thank you for your order of:\n"
  order.each{|k,v| message << "#{v} x #{k}\n"}
  message << delivery_time
  message
end
