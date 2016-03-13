require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
require_relative 'sms_message'

get '/sms' do
  incoming = params[:Body]

  twiml = Twilio::TwiML::Response.new do |r|
    if incoming.is_a? Hash
      r.Message SMSMessage.new.format_order(incoming)
    else
      r.Message "Please submit a valid order."
    end
  end
  twiml.text
end
