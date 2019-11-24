require 'bundler'
require 'twilio-ruby'
require 'sinatra'

Bundler.require()

post '/sms' do

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message body: 'Thank you for your order!'
  end

  twiml.to_s

end