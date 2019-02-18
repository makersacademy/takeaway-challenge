require 'sinatra'
require 'twilio-ruby'

post '/receive_sms' do
  content/type('text/xml')

  '<Response><Message>Yasssss</Message></Response>'
end
