#require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'sinatra'

TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
TWILIO_NUMBER = ENV['TWILIO_NUMBER']

set :bind, '0.0.0.0'
set :port, ENV['TWILIO_STARTER_RUBY_PORT'] || 4567

client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN

get '/' do
  erb :index
end

post '/message' do
  client.account.sms.messages.create(
    :from => TWILIO_NUMBER,
    :to => params[:to],
    :body => "Thank you! Your order was placed and will be delivered before #{(Time.now+(60*60)).strftime('%r')}"
    )
  'Message on the way!'
end

response = Twilio::TwiML::Response.new do |r|
  r.Say 'hello there', voice: 'alice'
  r.Dial callerId: '+447922362535' do |d|
    d.Client 'jenny'
  end
end

# print the result
puts response.text
# # put your own credentials here
# account_sid = 'AC3709c6c895aa403b91eb363085da76fa'
# auth_token = '338e5f89ced33696e966e99c23db88d4'

# # set up a client to talk to the Twilio REST API
# @client = Twilio::REST::Client.new account_sid, auth_token


# @client.messages.create(
#   from: '+441242305380',
#   to: '+447922362535',
#   body: "Thank you! Your order was placed and will be delivered before #{(Time.now+(60*60)).strftime('%r')}"
# )

