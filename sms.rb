require 'twilio-ruby'
require 'sinatra'

set :bind, '0.0.0.0'
set :port, ENV['TWILIO_STARTER_RUBY_PORT'] || 4567

client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

get '/' do
  erb :index
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Thank you! Your order was placed and will be delivered before #{(Time.now+(60*60)).strftime('%r')}"
  end
  twiml.text
end
