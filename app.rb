require_relative 'lib/takeaway'
require 'sinatra/base'
require 'twilio-ruby'

class App < Sinatra::Base
  def takeaway(takeaway_class = TakeAway)
    takeaway_class.new
  end

  def responder(responder_class = Twilio::TwiML::MessagingResponse)
    responder_class
  end

  get '/' do
    takeaway.print_menu.gsub("\n", "<br>")
  end

  post '/sms' do
    content_type 'text/xml'
    body = params['Body']
    from = params['From']
    twiml = responder.new do |response|
      msg = takeaway.response(from, body)
      response.message(body: "\n\n#{msg}")
    end
    twiml.to_xml
  end
end
