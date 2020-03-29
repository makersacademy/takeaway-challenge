require 'sinatra'
require_relative 'sms_interface'

interface = SMSInterface.new

post '/sms' do
  interface.treat(params['Body'])
end
