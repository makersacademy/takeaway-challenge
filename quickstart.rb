require 'twilio-ruby'
require 'sinatra'

get '/sms-quickstart' do
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: 'Thanks for placing your order!')
  end

  twiml.to_s
end
