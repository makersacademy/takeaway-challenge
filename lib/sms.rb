require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/sms' do
  incoming = params[:Body]
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Thanks for saying '#{incoming}'!"
  end
  twiml.text
end
