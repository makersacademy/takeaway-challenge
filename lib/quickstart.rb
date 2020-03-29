# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'sinatra'

post '/sms-quickstart' do

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: 'Thank you! Your order was placed and will be delivered in 30 mins')
  end

  twiml.to_s
end


