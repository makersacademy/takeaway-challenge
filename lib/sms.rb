require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
require_relative 'sms_message'

get '/sms' do
  incoming = params[:Body]

  twiml = Twilio::TwiML::Response.new do |r|
    begin order = eval(incoming)
      if order.empty?
         r.Message "Your order contained no items."
      else
        r.Message SMSMessage.new.format_order(order)
      end
    rescue Exception => exc
      r.Message "Please submit a valid order."
    end
  end
  twiml.text
end
