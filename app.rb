require 'sinatra/base'
require 'twilio-ruby'

class App < Sinatra::Base
  get '/sms' do
    content_type 'text/xml'
    twiml = Twilio::TwiML::MessagingResponse.new do |response|
      response.message(body: 'hello there')
    end
    twiml.to_xml
  end
end
