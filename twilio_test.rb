require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/' do
  'Hello Mudder Fudgers! Currently running version ' + Twilio::VERSION + \
  ' of the twilio-ruby library'
end
