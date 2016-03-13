require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
require_relative 'sms_message'

get '/sms' do
  incoming = params[:Body]

  twiml = Twilio::TwiML::Response.new do |r|
    begin eval(incoming)
      if eval(incoming).empty?
        r.Message "Please submit a valid order. You put #{incoming.class}"
      else
        r.Message SMSMessage.new.format_order(incoming)
      end
    rescue Exception => exc
      r.Message "EXC: Please submit a valid order."
    end
  end
  twiml.text
end
