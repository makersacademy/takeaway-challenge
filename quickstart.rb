require 'twilio-ruby'
require 'sinatra'

# get '/' do
#   "Hello World"
# end

post '/sms-quickstart' do
  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: 'Ahoy! Thanks so much for your message.')
  end

  content_type "text/xml"
  
  twiml.to_s
end
