require 'sinatra'
require 'twilio-ruby'

post '/receive_sms' do
  content_type 'text/xml'
  response = Twilio::TwiML::Response.new do |r|
    r.Message 'hello'
  end
  response.to_xml
end
