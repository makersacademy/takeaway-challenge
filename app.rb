require 'sinatra/base'
require 'twilio-ruby'

class App < Sinatra::Base
  post '/sms' do
    twiml = Twilio::TwiML::MessagingResponse.new do |r|
      r.message 'The Robots are coming! Head for the hills!'
    end
    content_type 'text/xml'
    twiml.to_s
  end
end
