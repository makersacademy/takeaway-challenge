require 'twilio-ruby'
require 'sinatra/base'
require 'erb'

class OrderApp < Sinatra::Base
  set :title, "SMS Viewport"

  get '/' do
    #"<b><u>Welcome to the SMS Viewport<u></b>"

    erb(:index)
  end

  get '/messages' do
    "<a href='https://api.twilio.com/2010-04-01/Accounts/AC5f14dab093fe403c144c070dcc5dbb82/Messages.json'>Check messages</a>"
  end

  get '/sms' do
    twiml = Twilio::TwiML::MessagingResponse.new do |r|
      r.message(body: 'Thank you for placing an order!')
    end

    content_type "text/xml"

    twiml.to_s
  end



end