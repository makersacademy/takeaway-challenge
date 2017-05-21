require 'twilio-ruby'
require 'sinatra'

post '/receiver' do
  body = params['Body'].downcase

  order = File.open('orders.txt', 'w')
  order.puts("#{body}\n")
  order.close

  twiml = Twilio::TwiML::Response.new do |r|
    r.Message 'Hi there, thanks for the message!'
  end
  twiml.text
end
