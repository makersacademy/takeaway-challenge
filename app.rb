require_relative 'lib/takeaway'
require 'sinatra/base'
require 'twilio-ruby'

class App < Sinatra::Base
  get '/' do
    TakeAway.new.get_menu.gsub("\n", "<br>")
  end

  post '/sms' do
    body = params['Body']
    number = params['From']

    content_type 'text/xml'
    twiml = Twilio::TwiML::MessagingResponse.new do |response|
      response.message(body: params['From'])
    end
    twiml.to_xml
  end
end
