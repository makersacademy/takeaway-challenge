require 'twilio-ruby'
require 'sinatra'
require_relative 'lib/request_handler'

set :port, 80
set :bind, '0.0.0.0'

post '/sms-in' do
  handler = RequestHandler.new(params)

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: handler.response)
  end

  twiml.to_s
end