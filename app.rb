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
    body = params['Body']
    from = params['From']
    twiml = Twilio::TwiML::MessagingResponse.new do |response|
      if body =~ /[YyNn]/
        response.message(body: takeaway.incoming_confirmation(from, body))
      else
        response.message(body: takeaway.incoming_order(from, body))
      end
    end
    twiml.to_xml
  end
end
