require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/sms-quickstart' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Thanks for the fucking text."
  end
  twiml.text
end
