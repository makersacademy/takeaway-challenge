require_relative 'lib/takeaway'
require 'sinatra/base'
require 'twilio-ruby'

module Sinatra
  module TakeAwayHelper
    def takeaway
      TakeAway.new
    end
  end
end


class App < Sinatra::Base

  helpers Sinatra::TakeAwayHelper

  get '/' do
    takeaway.print_menu.gsub("\n", "<br>")
  end

  post '/sms' do
    content_type 'text/xml'
    twiml = Twilio::TwiML::MessagingResponse.new do |response|
      response.message(body: takeaway.response(body))
    end
    twiml.to_xml
  end
end
