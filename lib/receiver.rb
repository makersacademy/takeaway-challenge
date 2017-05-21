require 'twilio-ruby'
require 'sinatra'

get '/receiver' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message 'Thanks for the order!'
  end
  twiml.text
end