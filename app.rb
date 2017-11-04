require 'sinatra/base'
require 'twilio-ruby'

class App < Sinatra::Base
  post '/sms' do
    content_type 'text/xml'
    twiml = Twilio::TwiML::MessagingResponse.new do |r|
      r.message 'The Robots are coming! Head for the hills!'
    end
    twiml.to_xml
  end
end
