require 'twilio-ruby'
require 'sinatra'

post '/receiver' do
  body = params['Body'].downcase
  
end
