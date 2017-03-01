require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/receive_sms' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hey Monkey. Thanks for the message!"
  end
  twiml.text
end
